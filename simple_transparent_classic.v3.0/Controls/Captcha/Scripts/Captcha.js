(function ()
{
  if (!window.Captcha)
  {
    window.Captcha = new Object();
  }

  Captcha.captchaStart = captchaStart;
  Captcha.captchaLoadSound = captchaLoadSound;
  Captcha.captchaReloadImage = captchaReloadImage;
  Captcha.closeWindowAndShowErrorMessage = closeWindowAndShowErrorMessage;

  var captchaImg = null;
  var captchaNewImg = null;
  var captchaParent = null;
  var captchaPrompt = null;
  var captchaReload = null;


  function captchaStart(imgId, prompt)
  {
    captchaImg = document.getElementById(imgId);

    if (!captchaImg)
    {
      return;
    }

    captchaImg.alt = prompt;
  }


  function captchaLoadSound(imgId, soundPlaceholderId)
  {
    captchaImg = document.getElementById(imgId);

    if (!captchaImg)
    {
      return;
    }

    var src = captchaImg.src;

    var i = src.indexOf('?get=image');
    var newSrc = src.substr(0, i) + '?get=sound' + src.substr(i + 10);

    i = newSrc.indexOf('&di=');
    if (i > 0)
      newSrc = newSrc.substr(0, i);

    newSrc += '&d=' + captchaGetTimestamp();

    var placeholder = document.getElementById(soundPlaceholderId);

    var a = new Array();
    a.push("<object id='captchaSound' classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' height='0' width='0' style='width:0; height:0;'><param name='AutoStart' value='1' /><param name='Volume' value='0' /><param name='PlayCount' value='1' /><param name='FileName' value='");
    a.push(newSrc);
    a.push("' /><embed id='captchaSoundEmbed' src='");
    a.push(newSrc);
    a.push("' autoplay='true' hidden='true' volume='100' type='");
    a.push(captchaGetMimeType());
    a.push("' style='display:inline;' /></object>");

    var objectSrc = a.join('');

    placeholder.innerHTML = '';
    placeholder.innerHTML = objectSrc;
  }


  function captchaGetTimestamp()
  {
    var d = new Date();
    return (d.getTime() + (d.getTimezoneOffset() * 60000));
  }


  function captchaGetMimeType()
  {
    return 'audio/x-wav';
  }


  function captchaReloadImage(anchor, imgId, id, prompt)
  {
    captchaReload = anchor;

    if (!captchaReload)
    {
      return;
    }

    captchaReload.disabled = true;
    captchaImg = document.getElementById(imgId);

    if (!captchaImg)
    {
      captchaReload.disabled = false;
      return;
    }

    var src = captchaImg.src;
    var idvalue = document.getElementById(id).value;
    
    var newSrc = src.substr(0, src.indexOf(idvalue)) + idvalue + '&clear=1' + '&d' + captchaGetTimestamp();

    captchaNewImg = document.createElement('img');
    captchaNewImg.onload = captchaShowImage;
    captchaNewImg.id = captchaImg.id;
    captchaNewImg.alt = captchaImg.alt;
    captchaNewImg.src = newSrc;

    captchaPrompt = document.createElement('span');
    captchaPrompt.appendChild(document.createTextNode(prompt));

    captchaParent = captchaImg.parentNode;
    captchaParent.removeChild(captchaImg);
    captchaParent.appendChild(captchaPrompt);
  }


  function captchaShowImage()
  {
    if (captchaReload && captchaNewImg && captchaParent && captchaPrompt)
    {
      captchaParent.removeChild(captchaPrompt);
      captchaParent.appendChild(captchaNewImg);
      captchaReload.disabled = false;
    }
  }

  function closeWindowAndShowErrorMessage(btnId, txtId, reloadLinkId, errorMessageText)
  {
    if (window.opener != null)
    {
      var btn = window.opener.document.getElementById(btnId);
      var txt = window.opener.document.getElementById(txtId);

      if (btn)
      {
        btn.disabled = false;
      }

      if (txt)
      {
        var errorMessageId = 'spanErrorMessageId';
        var newErrorMessageElement = window.opener.document.getElementById(errorMessageId);

        var spanCssClassName = 'validationError';        
        var reloadCapthaLink = window.opener.document.getElementById(reloadLinkId);        

        if (reloadCapthaLink)
        {
          reloadCapthaLink.click()
        }

        if (!newErrorMessageElement)
        {
          if (BonaPage.Browser.isIE)
          {
            var parent = txt.parentNode;
            var a = new Array();
            a.push(parent.innerHTML);
            a.push('<span id="' + errorMessageId + '" class="' + spanCssClassName + '">');
            a.push(errorMessageText);
            a.push('</span>');
            parent.innerHTML = a.join('');
          }
          else
          {
            var span = document.createElement('span');
            span.setAttribute("id", errorMessageId);
            span.setAttribute("class", spanCssClassName);
            sometext = document.createTextNode(errorMessageText);
            span.appendChild(sometext);
            txt.parentNode.appendChild(span);
          }
        }
      }
    }

    var windowObject = window.self;
    windowObject.opener = window.self;
    var bodyes = document.getElementsByTagName('body');
    for (var i = 0; i < bodyes.length; i++)
    {
      bodyes[i].innerHTML = '';
    }

    windowObject.close();
  }

})();
