<div id="idCaptchaTextBoxContainer" class="fieldContainer textFieldContainer">
    <div class="fieldSubContainer singleStringContainer">
        <table><tr>
            <td class="left">
                <div class="fieldLabel">
                    <input name="captchaId1" value="<$Model.Id1$>" id="captcha_id1" type="hidden">
                    <input name="captchaId2" value="<$Model.Id2$>" id="captcha_id2" type="hidden">
                    <span  validateOnLoad="true" validatorType="required" controlToValidate="captcha" display="static" errorMessage="<$Model.Text.ErrorInvalidCaptcha$>" class="mandatorySymbol" style="visibility:hidden;">*</span><strong class="mandatoryLabel"><$Model.Text.Code$></strong>
                </div>
            </td>
            <td class="right">
                <div class="fieldBody">
                    <input name="captcha" maxlength="6" class="captchaCode" type="text" id="captcha" />
                    <$if(Model.InvalidCaptcha)$>
                    <span class="mandatorySymbol"><$Model.Text.ErrorInvalidCaptcha$></span>
                    <$endif$>
                </div>
            </td>
        </tr></table>
    </div>
</div>

<div id="idCaptchaImageContainer" class="fieldContainer simpleTextContainer">
<div class="fieldSubContainer labeledTextContainer">
    <div class="fieldLabel">&nbsp;</div>
    <div class="fieldBody">
        <div class="captchaImageContainer">
            <div class="captchaGuiding"><$Model.Text.Intro$></div>
            <div class="captchaImage">
                <img src="<$Model.Urls.CaptchaImage$>" alt="<$Model.Text.CaptchaImageTitle$>" onload="this.alt='<$Model.Text.CaptchaImageTitle$>';" width="270" border="0" height="52" id="imgCaptcha">
            </div>
            <div class="captchaIcons">
                <a href="<$Model.Urls.CaptchaSound$>" title="<$Model.Text.CaptchaSoundTitle$>" onclick="Captcha.captchaLoadSound('imgCaptcha','divSound');this.blur();return false;">
                    <img src="<$Model.Urls.CaptchaSoundImage$>" id="imgSound" alt="<$Model.Text.CaptchaSoundTitle$>" width="22" border="0" height="22">
                </a>
                <a href="#" id="aReload" title="<$Model.Text.TryAnotherCode$>" onclick="Captcha.captchaReloadImage(this,'imgCaptcha','captcha_id1','captcha_id2','<$Model.Text.Loading$>');this.blur();return false;">
                    <img src="<$Model.Urls.CaptchaReloadImage$>" id="imgReload" alt="<$Model.Text.TryAnotherCode$>" width="22" border="0" height="22">
                </a>
                <div id="divSound" class="captchaSoundHolder"></div>
            </div>
        </div>
    </div></div>
</div>

<script language="javascript">
BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, function () { Captcha.captchaStart('imgCaptcha','<$Model.Text.Loading$>'); });
</script>

<div class="clearEndContainer"></div>