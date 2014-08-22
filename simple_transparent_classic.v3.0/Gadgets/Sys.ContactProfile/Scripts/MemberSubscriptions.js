(function() {

  if (!window.memberSubscriptionsHelper)
  {
    window.memberSubscriptionsHelper = {};
  }
    
  memberSubscriptionsHelper.editEnableEmailsClick = function()
  {
    this.setSubscriptionsEnabling();
  }
  
  memberSubscriptionsHelper.setSubscriptionsEnabling = function()
  {
    var allowDisplayCheckBox = BonaPage.$(this.AllowDisplayCheckBoxId);
    var contentControl = BonaPage.$(this.ContentControlId);
    
    if (!contentControl || !allowDisplayCheckBox) 
    {
      return;
    }
    
    contentControl.style.display = allowDisplayCheckBox.checked ? "block" : "none";
  }
  
  memberSubscriptionsHelper.enableSubscription = function(checkBoxID, dropDownID)
  {
    var enableCheckBox = BonaPage.$(checkBoxID);
    var typeDropDown = BonaPage.$(dropDownID);
    
    if (!enableCheckBox || !typeDropDown) 
    {
      return;
    }
    
    typeDropDown.disabled = !enableCheckBox.checked;
  }
    
}) ();


