
$('a').click(function() {
    console.log('clicked');
    var text = $(this).text();
    console.log(text);
});

$('body').click(function() {
    console.log('click is working.');
    console.log($(this));
    });

console.log('The script loaded, at least.');