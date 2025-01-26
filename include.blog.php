<?php

function isNewBlogPost($post)
{
	$weekAgo = strtotime('-1 week');
	return $post['created_at'] > $weekAgo;
}
function retrieveBlogPost($postId)
{
    $post = array();
    if ($postId != null)
    {
        $postId = basename($postId);
        include(K_WEB_ROOT . "/blog_posts/$postId.php");
        if ($generate_blog_post != null)
        {
            $res = $generate_blog_post;
            $post['internal_warnings'] = array();
            $post['internal_errors'] = array();
            $post['text'] = formatMarkdown(file_get_contents(K_WEB_ROOT. "/blog_posts/$postId.md"));
            $post['subject'] = $res['subject'];
            $post['description'] = isset($res['description']) ? $res['description'] : "";
            $post['created_at'] = $res['created_at'];
            if (isset($res['updated_at']))
            {
                $post['updated_at'] = $res['updated_at'];
            }
            if (isset($res['embed_image'])) {
                if (str_ends_with($res['embed_image'], '.png')) {
                    $post['embed_image'] = $res['embed_image'];
                }
            }
            $post['tags'] = array();
            if (isset($res['tags'])) {
                $post['tags'] = $res['tags'];
            }
            // 0: show
            // 1: pretend it doesn't exist
            // 2: hide in listing
            $post['hide_state'] = isset($res['hide_state']) ? $res['hide_state'] : 0;
            if (isset($post['created_at']))
            {
                $post['created_at_f'] = date('F j, Y', $post['created_at']);
                $post['created_at_fl'] = date('c', $post['created_at']);
            }
            if (isset($post['updated_at']))
            {
                $post['updated_at_f'] = date('F j, Y', $post['updated_at']);
                $post['updated_at_fl'] = date('c', $post['updated_at']);
            }

            if (isset($res['comment_cfg'])) {
                $comment_config=$res['comment_cfg'];
                if (isset($comment_config['system'])) {
                    $cfg_system = $comment_config['system'];
                    $cfg_system_formatted = 'comment_cfg -> system:'.$cfg_system.' ';
                    if ($cfg_system == 'utterances') {
                        $utterances_cfg = array(
                            'enable' => 1,
                            'repo' => CFG_UTTERANCES_REPO,
                            'label' => 'comment section - blog post',
                            'theme' => 'preferred-color-scheme',
                        );
                        if (isset($comment_config['issue_number'])) {
                            $utterances_cfg['issue_number'] = $comment_config['issue_number'];
                        } elseif (isset($comment_config['issue_term'])) {
                            $utterances_cfg['issue_term'] = $comment_config['issue_term']; 
                        } else {
                            $utterances_cfg['enable'] = 0;
                            array_push($post['internal_errors'],
                            $cfg_system_formatted.'not sure how to configure utterances. tried `issue_number` and `issue_term`');
                        }

                        if ($utterances_cfg['enable'] == 1) {
                            $post['utterances_cfg'] = $utterances_cfg;
                        } else {
                            array_push($post['internal_errors'],
                            $cfg_system_formatted.'disabled due to one or more configuration error/warning.');
                        }
                    } else {
                        array_push($post['internal_warnings'],
                        'comment_cfg: unknown value for "system" ('.$cfg_system.')');
                    }
                }
                else {
                    array_push($post['internal_errors'],
                    'comment_cfg: missing value for "system"');
                }
                
            }

            if (isset($res['meta']))
            {
                if (isset($_META))
                {
                    // concat post meta before current meta to override things
                    array_merge($res['meta'], $_META);
                }
                else
                {
                    $_META = $res['meta'];
                }
            }
        }
    }
    return $post;
}

function getAllBlogPosts()
{
    $files = scandir(K_WEB_ROOT . "/blog_posts/");
    $result = array();
    foreach ($files as $f)
    {
        if (str_ends_with($f, '.php'))
        {
            $pn = preg_replace('/\.\w+$/', '', $f);
            $p = retrieveBlogPost($pn);
            if ($p != null)
            {
                $pm = array_merge($p,
                array(
                    'id' => $pn
                ));
                if ($p['hide_state'] != 1 && $p['hide_state'] != 2)
                {
                    array_push($result, $pm);
                }
            }
        }
    }
    usort( $result, function( $a, $b )
    {
        if ( $a['created_at'] === $b['created_at'] ) return 0;
        if ( strpos( $b['created_at'], '0000' ) !== false ) return 1;
        return ( $a['created_at'] < $b['created_at'] ) ? 1 : -1;
    });
    return $result;
}

function doesPostHaveTag($post, $filterTag) {
    if (!isset($filterTag) || strlen($filterTag) < 1) {
        return True;
    }

    $state = False;
    foreach ($post['tags'] as $tag) {
        if (strtolower($tag) == strtolower($filterTag)) {
            $state = True;
            break;
        }
    }
    return $state;
}