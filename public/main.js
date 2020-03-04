
// Made AJAX requests for each query so as to display results in the same page
// Results are displayed below input and button box

function anagrams(event) {
  word = $('#anagram-word').val();
  url = '/anagrams/' + word;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     document.getElementById("anagrams").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", url , true);
  xhttp.send();
  return false;
}

function prefixes(event) {
  word = $('#prefix-word').val();
  url = '/prefixed/' + word;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     document.getElementById("prefixes").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", url , true);
  xhttp.send();
  return false;
}

function ladder(event) {
  startWord = $('#start-word').val();
  endWord = $('#end-word').val();
  url = '/word_ladder/' + startWord + '/' + endWord;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     document.getElementById("word-ladder").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", url , true);
  xhttp.send();
  return false;
}

function init() {
  $('#anagram-button').on('click', anagrams);
  $('#prefix-button').on('click', prefixes);
  $('#word-ladder-button').on('click', ladder);
}

$(init);