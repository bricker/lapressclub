(function ()
{
  if (!window.MemberPublicProfilePhotoGallery)
  {
    window.MemberPublicProfilePhotoGallery = {};
  }

  var albumParam = '';
  var processingText = 'Please wait...';
  var deleteConfirmation = 'Are you sure you want to delete?';
  var deletePhotoConfirmation = 'Are you sure you want to delete this photo?';
  var saveAction = false;
  var photosHolder = false;
  var photosHolderHeight = false;
  var titleTextBox = false;
  var descriptionTextBox = false;
  var saveButton = false;
  var altSaveButton = false;
  var saveLinkButton = false;
  var deleteButton = false;
  var cancelButton = false;
  var uploadButton = false;
  var uploadAction = false;
  var viewModeRadioContainer = false;
  var uploadButtonContainer = false;
  var descriptionContainer = false;
  var descriptionHeightUrlKey = false;
  var countPhotosPerRowUrlKey = false;
  var pagingKey = false;
  var saveAlbumDialogInited = false;
  var uploadPhotosDialogInited = false;
  var photoItemId = false;
  var photoItemTimeout = false;
  var actionIsRunning = false;
  var pendingSender = false;
  var pendingImageDivId = false;
  var pendingFullDescriptionDivId = false;
  var pendingSmallDescriptionDivId = false;

  MemberPublicProfilePhotoGallery.InitPhotoGallery = initPhotoGallery;
  MemberPublicProfilePhotoGallery.ImageMenu_OnMouseOver = imageMenuMouseOver;
  MemberPublicProfilePhotoGallery.ImageMenu_OnMouseOut = imageMenuMouseOut;
  MemberPublicProfilePhotoGallery.NavigateToList = navigateToList;
  MemberPublicProfilePhotoGallery.CheckLength = checkLength;

  function initPhotoGallery(p)
  {
    if (p.albumParam) albumParam = p.albumParam;
    if (p.processingText) processingText = p.processingText;
    if (p.deleteConfirmation) deleteConfirmation = p.deleteConfirmation;
    if (p.deletePhotoConfirmation) deletePhotoConfirmation = p.deletePhotoConfirmation;
    if (p.photosHolderId) photosHolder = BonaPage.$(p.photosHolderId);
    if (p.saveActionId) saveAction = BonaPage.$(p.saveActionId);
    if (p.titleTextBoxId) titleTextBox = BonaPage.$(p.titleTextBoxId);
    if (p.descriptionTextBoxId) descriptionTextBox = BonaPage.$(p.descriptionTextBoxId);
    if (p.saveButtonId) saveButton = BonaPage.$(p.saveButtonId);
    if (p.altSaveButtonId) altSaveButton = BonaPage.$(p.altSaveButtonId);
    if (p.saveLinkButtonId) saveLinkButton = BonaPage.$(p.saveLinkButtonId);
    if (p.deleteButtonId) deleteButton = BonaPage.$(p.deleteButtonId);
    if (p.cancelButtonId) cancelButton = BonaPage.$(p.cancelButtonId);
    if (p.uploadButtonId) uploadButton = BonaPage.$(p.uploadButtonId);
    if (p.uploadActionId) uploadAction = BonaPage.$(p.uploadActionId);
    if (p.viewModeRadioContainerId) viewModeRadioContainer = BonaPage.$(p.viewModeRadioContainerId);
    if (p.uploadButtonContainerId) uploadButtonContainer = BonaPage.$(p.uploadButtonContainerId);
    if (p.descriptionContainerId) descriptionContainer = BonaPage.$(p.descriptionContainerId);
    if (p.descriptionHeightUrlKey) descriptionHeightUrlKey = p.descriptionHeightUrlKey;
    if (p.countPhotosPerRowUrlKey) countPhotosPerRowUrlKey = p.countPhotosPerRowUrlKey;
    if (p.pagingUrlKey) pagingKey = p.pagingUrlKey;
  }

 
  function setDisplay(element)
  {
    if (element)
    {
      element.style.display = '';
    }
  }

  function setDisplayInline(element)
  {
    if (element)
    {
      element.style.display = 'inline';
    }
  }

  function setDisplayBlock(element)
  {
    if (element)
    {
      element.style.display = 'block';
    }
  }

  function setDisplayNone(element)
  {
    if (element)
    {
      element.style.display = 'none';
    }
  }

  function setDisabled(element)
  {
    if (element)
    {
      element.disabled = true;
    }
  }


  function imageMenuMouseOver(sender, imageDivId, fullDescriptionDivId, smallDescriptionDivId)
  {
    if (photoItemTimeout && photoItemId == imageDivId)
    {
      clearTimeout(photoItemTimeout);
      photoItemTimeout = false;
      return;
    }

    if (actionIsRunning)
    {
      return;
    }

    sender.parentNode.style.height = sender.offsetHeight + 'px';
    BonaPage.$(imageDivId).className = 'photoAlbumItemThumbnailPhotoHover';
    sender.className = 'photoInnerContainerOver';
    sender.style.zIndex = sender.style.zIndex + 1;
    var fullDescriptionDiv = BonaPage.$(fullDescriptionDivId);
    setDisplayBlock(fullDescriptionDiv);
    setDisplayNone(BonaPage.$(smallDescriptionDivId));

    if (photosHolder)
    {
      photosHolderHeight = photosHolder.offsetHeight;
      if (!photosHolder.Y) BonaPage.Utils.getXY(photosHolder);
      if (!fullDescriptionDiv.Y) BonaPage.Utils.getXY(fullDescriptionDiv);
      var outHeigth = fullDescriptionDiv.Y + fullDescriptionDiv.offsetHeight - photosHolder.Y - photosHolderHeight;

      if (outHeigth > 0)
      {
        photosHolder.style.height = (photosHolderHeight + outHeigth + 10) + 'px';
      }
    }
  }

  function doImageMenuMouseOut(sender, imageDivId, fullDescriptionDivId, smallDescriptionDivId)
  {
    BonaPage.$(imageDivId).className = 'photoAlbumItemThumbnailPhoto';
    sender.className = 'photoInnerContainer';
    sender.style.zIndex = sender.style.zIndex - 1;
    setDisplayNone(BonaPage.$(fullDescriptionDivId));
    setDisplayBlock(BonaPage.$(smallDescriptionDivId));

    if (photosHolderHeight && photosHolder.offsetHeight > photosHolderHeight)
    {
      photosHolder.style.height = photosHolderHeight + 'px';
    }

    photoItemId = false;
    photoItemTimeout = false;
  }

  function imageMenuMouseOut(sender, imageDivId, fullDescriptionDivId, smallDescriptionDivId)
  {
    if (actionIsRunning)
    {
      if (!pendingSender)
      {
        pendingSender = sender;
        pendingImageDivId = imageDivId;
        pendingFullDescriptionDivId = fullDescriptionDivId;
        pendingSmallDescriptionDivId = smallDescriptionDivId;
      }

      return;
    }

    if (photoItemTimeout && photoItemId == imageDivId)
    {
      return;
    }

    photoItemId = imageDivId;
    photoItemTimeout = setTimeout(function () { doImageMenuMouseOut(sender, imageDivId, fullDescriptionDivId, smallDescriptionDivId); }, 10);
  }
  
  function navigateToList(url)
  {
    var descriptionHeight = (descriptionContainer) ? descriptionContainer.offsetHeight : 0;
    var countPhotosPerRow = 0;

    if (photosHolder)
    {
      var y = 0;
      var bulets = photosHolder.getElementsByTagName('LI');
      for (var i = 0; i < bulets.length; i++)
      {
        BonaPage.Utils.getXY(bulets[i]);
        if (i == 0)
        {
          y = bulets[i].Y;
        }
        else if (y < bulets[i].Y)
        {
          countPhotosPerRow = i;
          break;
        }
      }
    }

    if (descriptionHeightUrlKey && countPhotosPerRowUrlKey)
    {
      var index = url.indexOf('?', 0);
      url = index == -1 ? url + '?' : url + '&';
      url += descriptionHeightUrlKey + '=' + descriptionHeight + '&' + countPhotosPerRowUrlKey + '=' + countPhotosPerRow;
    }

    window.location = url;
  }

  function checkLength(e, oObject, maxLength)
  {
    if (oObject.value.length < maxLength)
    {
      return true;
    }
    else
    {
      var keyID = (window.event) ? event.keyCode : e.keyCode;
      if ((keyID >= 37 && keyID <= 40) || (keyID == 8) || (keyID == 46))
      {
        if (window.event) e.returnValue = true;
      }
      else
      {
        if (window.event) e.returnValue = false;
        else e.preventDefault();
      }
    }
  }
})();