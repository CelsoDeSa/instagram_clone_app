# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#picture_tag_list').tokenInput '/tag.json'
		theme: 'facebook'
		prePopulate: $('#picture_tag_list').data('load')
		preventDuplicates: true
		resultsLimit: 3
		tokenLimit: 7
		searchingText: "Press the space key for New Tags"