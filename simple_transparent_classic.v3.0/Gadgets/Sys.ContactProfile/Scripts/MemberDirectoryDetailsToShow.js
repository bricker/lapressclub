var memberDirectoryDetailsToShowHelper;

(function() 
{
  if (memberDirectoryDetailsToShowHelper == null)
  {
    memberDirectoryDetailsToShowHelper = new Object();
  }
  
  function $(id) 
  {
    return document.getElementById(id);
  }

  memberDirectoryDetailsToShowHelper.editIncludeMeInMemberDirectoryClick = function()
  {
    this.checkAllowDisplayCheckBox();
  }
  
  memberDirectoryDetailsToShowHelper.checkAllowDisplayCheckBox = function()
  {
    var allowDisplayCheckBox = $(this.AllowDisplayCheckBoxId);
    if (allowDisplayCheckBox)
    {
      this.setMemberFieldTableMode(!allowDisplayCheckBox.checked);
    }
  }
  
  memberDirectoryDetailsToShowHelper.setMemberFieldTableMode = function(disabled)
  {
    var fieldsControl = $(this.FieldsControlId);
    var inputs = this.getInputs(fieldsControl);
    
    for (var i = 0; i < inputs.length; i++)
    {
      if (inputs[i])
      {
        inputs[i].disabled = disabled;
      }
    }
  }
  
  memberDirectoryDetailsToShowHelper.getInputs = function(node)
  {
    var inputs = new Array();
    this.populateInputs(inputs, node);
    return inputs;
  }
  
  memberDirectoryDetailsToShowHelper.populateInputs = function(inputs, node)
  {
    if (!node)
      return;
    
    if (node.tagName && node.tagName.toLowerCase() == "input")
    {
      inputs[inputs.length] = node;
    }

    if (!node.childNodes || node.childNodes.length == 0)
    {
      return;
    }
  
    for (var i = 0; i < node.childNodes.length; i++)
    {
      var subNode = node.childNodes[i];
      this.populateInputs(inputs, subNode);
    }
  }
  
}) ();


