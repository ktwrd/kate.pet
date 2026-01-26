#!/usr/bin/env python
from datetime import datetime

now = datetime.now()

def format_title(title, required, extra=None):
    if title is not None:
        title_str = title
        if required:
            if extra is None:
                title_str += ' (required)'
            else:
                title_str += ' (required, ' + str(extra) + ')'
        else:
            if extra is not None:
                title_str += ' (' + str(extra) + ')'
        return title_str
    else:
        return None
def print_format_title(title, required, extra=None):
    s = format_title(title, required, extra)
    if s is not None:
        print(s)
def get_string(
        title='My thing!',
        required=False,
        defaultValue=None):
    defaultValue_title = None
    if defaultValue is not None:
        defaultValue_title = 'default: ' + str(defaultValue)
    print_format_title(title, required, defaultValue_title)


    s = input('> ')
    if len(s.strip()) < 1:
        if required:
            print('--- Value is required! ---')
            return get_string(title=None, required=required, defaultValue=defaultValue)
        else:
            print('Using default value')
            return defaultValue
    else:
        return s.replace("'", "\\'")
def get_enum_value_single(
    title='My enum',
    required=False,
    defaultIndex=None,
    possibleValues=[],
    possibleValuesDesc=[]):

    print_format_title(title, required)

    for i in range(len(possibleValues)):
        ps = str(possibleValues[i]) + ': ' + str(possibleValuesDesc[i])
        if i == defaultIndex:
            ps += ' (default)'
        print(ps)


    s = input('> ')
    if len(s.strip()) < 1:
        if required:
            print('--- Value is required! ---')
            return get_enum_value_single(title, required, defaultIndex, possibleValues, possibleValuesDesc)
        else:
            if defaultIndex is None:
                return None
            else:
                return possibleValues[defaultIndex]
    else:
        for x in possibleValues:
            if x == s:
                return x
        print('Could not find value %s. Try again please' % s)
        return get_enum_value_single(title, required, defaultIndex, possibleValues, possibleValuesDesc)

def get_string_arr(
        title='My string array',
        required=False):
    if title is not None:
        title += ' (comma separated)'
    print_format_title(title, required)
    s = str(input('> ')).split(',')
    resultArr = []
    for item in s:
        x = '\'%s\'' % (item.strip().replace("'", "\\'"))
        resultArr.append(x)
    return resultArr

def php_write(name, subject, hide_state, post_tags):
    filename = './web/blog_posts/%s.php' % name
    content = [
        '<?php',
        '$generate_blog_post = array(',
        '\t\'subject\' => \'%s\',' % subject.replace('\'', '\\\''),
        '\t\'description\' => \'\',',
        '\t' + ('\'created_at\' => mktime(%s),' % now.strftime(' %H, %M, %S, %m, %d, %Y').strip(' 0')).strip('mktime( '),
        '\t\'hide_state\' => %s,' % hide_state,
        '\t\'tags\' => array(%s)' % post_tags,
        ');',
        '?>'
    ]
    fphp = open(filename, 'x')
    fphp.write('\n'.join(content))
    fphp.close()
def md_write_blank(name):
    filename = './web/blog_posts/%s.md' % name
    fmd = open(filename, 'x')
    fmd.write('')
    fmd.close()

def write_all(name, subject, hide_state, post_tags):
    php_write(name, subject, hide_state, post_tags)
    md_write_blank(name)

name = get_string('PostId name', required=False, defaultValue=str(now.strftime('%Y%m%d')))
subject = get_string('Subject', required=True)
hide_state = get_enum_value_single('Hide state', required=True, defaultIndex=None, possibleValues=['0', '1', '2'], possibleValuesDesc=[
    'Show post',
    'Mark as deleted',
    'Hidden. Can only be access via URL'
])
post_tags = ','.join(get_string_arr('Tags', required=False))
write_all(name, subject, hide_state, post_tags)
