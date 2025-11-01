const spacingMap = [
    {
        prefix: 'p',
        style_name: 'padding',
        mod: (i) => {
            return i / 4
        }
    },
    {
        prefix: 'pr',
        style_name: 'padding-right'
    },
    {
        prefix: 'pl',
        style_name: 'padding-left'
    },
    {
        prefix: 'pt',
        style_name: 'padding-top'
    },
    {
        prefix: 'pb',
        style_name: 'padding-bottom'
    },
    
    {
        prefix: 'm',
        style_name: 'margin',
        mod: (i) => {
            return i / 4
        }
    },
    {
        prefix: 'mr',
        style_name: 'margin-right'
    },
    {
        prefix: 'ml',
        style_name: 'margin-left'
    },
    {
        prefix: 'mt',
        style_name: 'margin-top'
    },
    {
        prefix: 'mb',
        style_name: 'margin-bottom'
    }
]

var result = []

for (var item of spacingMap)
{
    var innerLines = [];
    item = {
        count_min: 1,
        count: 6,
        value_suffix: 'rem',
        mod: (i) => {
            return i
        },
        ...item
    }
    for (let i = item.count_min; i <= item.count; i++)
    {
        innerLines = [
            ...innerLines,
            `.${item.prefix}-${i} { ${item.style_name}: ${item.mod(i)}${item.value_suffix}; }`
        ]
    }
    result = [...result, ...innerLines]
}
console.log(result.join('\n'))