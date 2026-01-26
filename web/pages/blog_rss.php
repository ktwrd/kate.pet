<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include.php');
header('Content-Type: application/rss+xml');
echo "<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>";

$blogPosts = getAllBlogPosts();


?>

<rss version="2.0"
    xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <title>kate's blog</title>
        <link>https://kate.pet/p/blog</link>
        <description>Recent posts by kate, mostly ramblings and general announcements</description>
        <language>en-us</language>
        <managingEditor>kate@dariox.club (Kate Ward)</managingEditor>
        <webMaster>kate@dariox.club (Kate Ward)</webMaster>
        <copyright>Kate Ward</copyright>
        <lastBuildDate><?php
// get the latest date so lastBuildDate can be accurate.
$dateArray = array();
foreach ($blogPosts as $post)
{
    array_push($dateArray, $post['created_at']);
    if (isset($post['updated_at']))
    {
        array_push($dateArray, $post['updated_at']);
    }
}
rsort($dateArray, SORT_NUMERIC);
echo date(DateTime::RFC822, $dateArray[0]);
?></lastBuildDate>
        <atom:link href="https://kate.pet/blog.atom" rel="self" type="application/rss+xml" />

<?php
foreach ($blogPosts as $post)
{
    if ($post['hide_state'] == 0)
    {
        $postTitle = $post['subject'];
        $postId = $post['id'];
        $postPubDate = date(DateTime::RFC822, $post['created_at']);
        $postUpdStr = "";
        if (isset($post['updated_at']))
        {
            $postUpdStr = "
            <atom:updated>".date(DateTime::RFC3339, $post['updated_at'])." </atom:updated>";
        }
        $postDesc = $post['description'];
        echo
"        <item>
            <title>{$postTitle}</title>
            <link>https://kate.pet/blog/{$postId}</link>
            <pubDate>{$postPubDate}</pubDate>
            <guid>https://kate.pet/blog/{$postId}</guid>
            <description>{$postDesc}</description>
            <author>kate@dariox.club (Kate Ward)</author>".$postUpdStr."
        </item>
";
    }
}
?>
    </channel>
</rss>