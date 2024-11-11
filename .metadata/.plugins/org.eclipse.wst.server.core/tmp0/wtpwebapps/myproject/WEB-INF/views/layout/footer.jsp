<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="menu-btn">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
        </svg>
    </div>

    <div class="sidebar">
        <div class="x-btn">
            <a href="#" class="close-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                	<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                </svg>
            </a>
        </div>
        <ul>
		    <li> <a href="/vinyl/sale/search?hip-hop"> <input type="checkbox" id="hiphop" value="hip-hop" class="genre-checkbox"> <label for="hiphop"> HIP-HOP </label> </a> </li>
		    <li> <a href="/vinyl/sale/search?jazz"> <input type="checkbox" id="jazz" value="jazz" class="genre-checkbox"><label for="jazz"> JAZZ </label></a></li>
		    <li> <a href="/vinyl/sale/search?rock"> <input type="checkbox" id="rock" value="rock" class="genre-checkbox"><label for="rock"> ROCK </label></a></li>
		    <li> <a href="/vinyl/sale/search?pop"> <input type="checkbox" id="pop" value="pop" class="genre-checkbox"><label for="pop"> POP </label></a></li>
		    <li> <a href="/vinyl/sale/search?korean"> <input type="checkbox" id="korean" value="korean" class="genre-checkbox"><label for="korean"> KOREAN </label></a></li>
		</ul>
    </div>
    
    <script type="text/javascript">
	    // 이벤트 리스너 추가
	    document.querySelectorAll('.genre-checkbox').forEach(checkbox => {
	        checkbox.addEventListener('change', function() {
	            sendGenres();
	        });
	    });
	
	    function getSelectedGenres() {
	        return Array.from(document.querySelectorAll('.genre-checkbox:checked'))
	            .map(checkbox => checkbox.value);
	    }
	
	    function sendGenres() {
	        const selectedGenres = getSelectedGenres();
	        
	        fetch('/vinyl/filter', {
	            method: 'POST',
	            headers: { 'Content-Type': 'application/json' },
	            body: JSON.stringify({ genres: selectedGenres })
	        })
	        .then(response => response.json())
	        .then(data => { console.log('Response:', data); })
	        .catch(error => {
	            console.error('Error:', error);
	        });
	    }
    </script>
</body>
</html>