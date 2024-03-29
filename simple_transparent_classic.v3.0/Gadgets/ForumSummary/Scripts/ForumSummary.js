(function()
{
  if (window.ForumSummaryHelper)
  {
    return;
  }
  
  window.ForumSummaryHelper = new Object();
  
  function $(id) 
  {
    return document.getElementById(id);
  }
  
  ForumSummaryHelper.navigateToTopic = function(topicUrl)
  {
    window.location = topicUrl;
  }

  ForumSummaryHelper.highlight = function(elem)
  {
    var splitted = elem.className.split(' ');
    elem.className = splitted[0] + ' highlight'; 
  }

  ForumSummaryHelper.normlight = function(elem)
  {
    var splitted = elem.className.split(' ');
    elem.className = splitted[0] + ' normal'; 
  }
  
  ForumSummaryHelper.allForumsRadioSelected = function ()
  {
    var selectForumsListDiv = $(ForumSummaryHelper.selectForumsListId);
    selectForumsListDiv.style.display = "none";
  }

  ForumSummaryHelper.selectedForumsRadioSelected = function ()
  {
    var selectForumsListDiv = $(ForumSummaryHelper.selectForumsListId);
    selectForumsListDiv.style.display = "";
  }

})();