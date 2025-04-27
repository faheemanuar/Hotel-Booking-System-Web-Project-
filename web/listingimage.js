document.addEventListener('DOMContentLoaded', function() {
    var rooms = document.querySelectorAll('.room');

    rooms.forEach(function(room) {
        var images = room.querySelectorAll('.slide');
        var currentIndex = 0;
        var nextButton = room.querySelector('.next');
        var prevButton = room.querySelector('.prev');

        function showImage(index) {
            images.forEach((img, i) => {
                img.style.display = i === index ? 'block' : 'none';
            });
        }

        nextButton.addEventListener('click', function() {
            currentIndex = (currentIndex + 1) % images.length;
            showImage(currentIndex);
        });

        prevButton.addEventListener('click', function() {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            showImage(currentIndex);
        });

        // Initially display the first image
        showImage(currentIndex);
    });
});
