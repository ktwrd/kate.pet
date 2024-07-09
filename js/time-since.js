
function getMonthDifference(start, end)
{
    return (end.getMonth() - start.getMonth() + 12 * (end.getFullYear() - start.getFullYear()));
}
function dateDifference(dt1, dt2)
{
    /*
     * setup 'empty' return object
     */
    var ret = {
        seconds: 0,
        minutes: 0,
        hours: 0,
        days: 0,
        months: 0,
        years: 0
    };

    /*
     * If the dates are equal, return the 'empty' object
     */
    if (dt1 == dt2) return ret;

    /*
     * ensure dt2 > dt1
     */
    if (dt1 > dt2) {
        var dtmp = dt2;
        dt2 = dt1;
        dt1 = dtmp;
    }

    /*
     * First get the number of full years
     */

    var year1 = dt1.getFullYear();
    var year2 = dt2.getFullYear();

    var month1 = dt1.getMonth();
    var month2 = dt2.getMonth();

    var day1 = dt1.getDate();
    var day2 = dt2.getDate();

    /*
     * Set initial values bearing in mind the months or days may be negative
     */

    ret['years'] = year2 - year1;
    ret['months'] = month2 - month1;
    ret['days'] = day2 - day1;
    let dt1TS = dt1.getTime()
    let dt2TS = dt2.getTime()
    let distance = dt2TS - dt1TS
    ret['hours'] = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    ret['minutes'] = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    ret['seconds'] = Math.floor((distance % (1000 * 60)) / 1000);

    /*
     * Now we deal with the negatives
     */

    /*
     * First if the day difference is negative
     * eg dt2 = 13 oct, dt1 = 25 sept
     */
    if (ret['days'] < 0) {
        /*
         * Use temporary dates to get the number of days remaining in the month
         */
        var dtmp1 = new Date(dt1.getFullYear(), dt1.getMonth() + 1, 1, 0, 0, -1);

        var numDays = dtmp1.getDate();

        ret['months'] -= 1;
        ret['days'] += numDays;
    }

    /*
     * Now if the month difference is negative
     */
    if (ret['months'] < 0) {
        ret['months'] += 12;
        ret['years'] -= 1;
    }

    return ret;
}
/**
 * @description
 * Pluralize things.
 * @param {number|string} thing Thing to pluralize. When a string, will use the length of it.
 * @returns `s` when the assumed value of `thing` (or the length of it when it's a string) is greater than `1`. Otherwise an empty string is removed.
 */
function pluralize(thing) {
    var s = thing;
    if (typeof thing == 'string') {
        s = thing.length;
    }
    return s > 1 ? 's' : '';
}

const timeSinceContainerItems = document.querySelectorAll('[data-component=time-since-container]');
var elemIE = 0;
timeSinceContainerItems.forEach(_ie => {
    const element = _ie;
const elementIndex = parseInt(elemIE.toString());
    elemIE++;
    const innerElement = (() =>
    {
        var t = element.querySelector('[data-tag=inner-text]')
        if (t == null)
        {
            var e = document.createElement('div')
            e.className = 'time-since-text'
            e.setAttribute('data-tag', 'inner-text')
            element.appendChild(e)
            t = e
        }
        return t
    })()
    function gen() {
        let startDate = new Date(0)
        startDate.setUTCMilliseconds(element.attributes['data-timestamp'].value * 1000)
        let nowDate = new Date()
if (nowDate >= startDate) {
            if (element.attributes['data-complete-text']) {

                // when text content is null/undefined or it's empty, then remove the main element
                // for this instance of `time-since-container`.
                var completeTextContent = element.attributes['data-complete-text'].toString();
                if (!completeTextContent || (completeTextContent && completeTextContent.trim() < 1)) {
                    console.debug(`Removing element at index ${elementIndex} since 'data-complete-text' is empty and the countdown is done.`);
                    element.remove();
                    return;
                }

                // otherwise we just set the content of the innerElement to the value of the
                // `data-complete-text` attribute.
                innerElement.innerHTML = element.attributes['data-complete-text'];
                element.attributes['data-timer-complete'] = 'data-timer-complete';
                return;
            }
        }

        // Time calculations for days, hours, minutes and seconds
        var diff = dateDifference(startDate, nowDate);
        var years = diff.years;
        var months = diff.months;
        var weeks = diff.weeks;
        var days = diff.days;
        var hours = diff.hours;
        var minutes = diff.minutes;
        var seconds = diff.seconds;

        let str = []
        if (years > 0) {
            str.push(`${years} year${years > 1 ? 's' : ''}`)
        }
        if (months > 0) {
            str.push(`${months} month${months > 1 ? 's' : ''}`)
        }
        if (weeks > 0) {
            str.push(`${weeks} week${weeks > 1 ? 's' : ''}`)
        }
        if (days > 0) {
            str.push(`${days} day${days > 1 ? 's' : ''}`)
        }
        if (hours > 0) {
            str.push(`${hours} hour${hours > 1 ? 's' : ''}`)
        }
        if (minutes > 0) {
            str.push(`${minutes} minute${minutes > 1 ? 's' : ''}`)
        }
        str.push(`${seconds} second${seconds > 1 ? 's' : ''}`)

        innerElement.innerHTML = str.join(', ')
    }
    gen()
    setInterval(gen, 500);
});