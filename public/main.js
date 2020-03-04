//= require jquery
//= require jquery.min.js

function anagrams(event) {
  word = $('#anagram-word').val();
  window.location = '/anagrams/' + word;
  // $.get( "#anagram-link", function(data) { //So when clicking the button it is doing the alert
  //   alert("Vegetables are good for you!");
  // });
  // $.ajax({
  //   url: '/anagrams/' + word,
  //   type: 'GET',
  //   data: result,
  //   success: function(response) {
  //     ("#anagram-results").load(result)
  //   }
  // })
  return false;
}

function prefixes(event) {
  word = $('#prefix').val();
  window.location = '/prefixed/' + word;
  return false;
}

function ladder(event) {
  startWord = $('#start-word').val();
  endWord = $('#end-word').val();
  window.location = '/word_ladder/' + startWord + '/' + endWord;
  return false;
}

function init() {
  $('#anagram-link').on('click', anagrams);
  // $(document).ready(function() {
  //   $('#anagram-link').click(function() {
  //     $.get($('#anagram-word').val(), function(data, status) {
  //       $("#anagram-results").html(data);
  //       alert(status);
  //     })
  //   });
  // });
  $('#prefix-link').on('click', prefixes);
  $('#word-ladder').on('click', ladder);
}



$(init);