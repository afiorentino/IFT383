//@file autoDownload.js
//The purpose of this file is to execute a series of javascript commands in the browser to download
//the essay questions for IFT383's homework assignments in Canvas.

//ele is the variable name used to identify the DOM element's inner text for canvas quiz essay questions 
var ele = document.getElementsByClassName("user_content quiz_response_text enhanced");
var result;
//quizTitle is the variable used to identify the DOM element's inner text for a canvas quiz title
//the remainder of the name is removed for simplicity
var quizTitle = document.getElementById('quiz_title').innerText.split(" ")[0];
var element = document.createElement('a');

//The for loop below iterates through all of the essay questions in the document and downloads them as a txt
//file. The name for each download is incremented to facilitate this process
for(i = 0; i < ele.length; i++){
	var element = document.createElement('a');
	result = ele[i].innerText;
	element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(result));
	element.setAttribute('download', quizTitle + i);

	element.style.display = 'none';
	document.body.appendChild(element);
	element.click();
	document.body.removeChild(element);
}
