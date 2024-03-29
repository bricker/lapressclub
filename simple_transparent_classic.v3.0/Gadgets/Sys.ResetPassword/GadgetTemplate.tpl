﻿<$if(Model.Result.Success)$>
<$control.MessageBox(Text=Model.Text.Success, Success="True", WrapText="True")$>
<$else$>

<$if(Model.Result.UndefinedError)$>
    <$control.MessageBox(Text=Model.Text.UndefinedError, Error="True", ShowHeader="True", HeaderText=Model.Text.ErrorHeader)$>
<$else$>

    <$if(Model.Result.InvalidRequest)$>
    <$control.MessageBox(Text=Model.Text.ErrorInvalidRequest, Error="True", ShowHeader="True", HeaderText=Model.Text.ErrorHeader)$>
    <$else$>

        <div class="cornersContainer">
        <$control.Divs(cornersDivsTop = "true")$>
        </div>
        <div class="formContainer">
        <$control.Divs(designDivsBegin = "true")$>
            <div class="generalFieldsOuterContainer">
            <div class="cornersContainer">
                <$control.Divs(cornersDivsTop = "true")$>
            </div>
            <div class="generalFieldsContainer">
                <$control.Divs(designDivsBegin = "true")$>

                  <$control.Form(formBegin = "true", action = Model.Urls.ResetPassword, id = "idRequestForm")$>
                    <input type="hidden" name="id" value="<$Model.PendingOperationId$>">

                    <div id="idNewPasswordContainer" class="fieldContainer textFieldContainer">
                    <div class="fieldSubContainer singleStringContainer">
                        <table>
                        <tr>
                            <td class="left">
                            <div class="fieldLabel">
                                <span validateOnLoad="true" validatorType="required" controlToValidate="ctl00_ContentArea_NewPasswordTextBox" display="static" errorMessage="<$Model.Text.PasswordRequired$>" class="mandatorySymbol" style="visibility:hidden;" id="ctl00_ContentArea_NewPasswdRfv">*</span><strong><label for="ctl00_ContentArea_NewPasswordTextBox" id="ctl00_ContentArea_NewPasswordLabel"><$Model.Text.NewPasswordLabel$></label></strong>
                            </div>
                            </td>
                            <td class="right">
                            <div class="fieldBody">
                                <input name="newPassword" maxlength="50" id="ctl00_ContentArea_NewPasswordTextBox" class="typeText" autocomplete="off" type="password" />
                                <span validatorType="minLength" errorMessage="<$Model.Text.InvalidPasswordLength$>" minLengthValue="<$Model.MinimumPasswordLength$>" controlToValidate="ctl00_ContentArea_NewPasswordTextBox" id="ctl00_ContentArea_PasswdLengthCv" class="validationError" style="visibility: <$if(Model.Result.InvalidPasswordLength)$>visible<$else$>hidden<$endif$>;">
                                <$Model.Text.InvalidPasswordLength$>
                                </span>
                            </div>
                            </td>
                        </tr>
                        </table>
                    </div>
                    </div>

                    <div id="idNewPasswordConfirmContainer" class="fieldContainer textFieldContainer">
                    <div class="fieldSubContainer singleStringContainer">
                        <table>
                        <tr>
                            <td class="left">
                            <div class="fieldLabel">
                                <span validateOnLoad="true" validatorType="required" controlToValidate="ctl00_ContentArea_NewPasswordConfirm" display="static" errorMessage="<$Model.Text.PasswordConfirmationRequired$>" class="mandatorySymbol" style="visibility:hidden;" id="ctl00_ContentArea_NewPasswordConfirmRfv">*</span><strong><label for="ctl00_ContentArea_NewPasswordConfirm" id="ctl00_ContentArea_NewPasswordConfirmLabel"><$Model.Text.NewPasswordConfirmLabel$></label></strong>
                            </div>
                            </td>
                            <td class="right">
                            <div class="fieldBody">
                                <input name="newPasswordConfirm" maxlength="50" id="ctl00_ContentArea_NewPasswordConfirm" class="typeText" autocomplete="off" type="password" />
                                <span validatorType="passwordCompare" controlToValidate="ctl00_ContentArea_NewPasswordConfirm" compareWith="ctl00_ContentArea_NewPasswordTextBox" errorMessage="<$Model.Text.PasswordsDoNotMatch$>" id="ctl00_ContentArea_CompareValidator1" class="validationError" style="visibility: <$if(Model.Result.PasswordsDoNotMatch)$>visible<$else$>hidden<$endif$>;">
                                <$Model.Text.PasswordsDoNotMatch$>
                                </span>
                            </div>
                            </td>
                        </tr>
                        </table>
                    </div>
                    </div>

                    <div id="idActionButtonsContainer" class="fieldContainer textFieldContainer">
                    <div class="fieldSubContainer singleStringContainer">
                        <table>
                        <tr>
                            <td class="left">
                            <div class="fieldLabel">
                                &nbsp;
                            </div>
                            </td>
                            <td class="right">
                            <div class="fieldBody">
                                <input name="ctl00$ContentArea$SubmitBtn" value="<$Model.Text.SubmitButtonText$>" id="ctl00_ContentArea_SubmitBtn" type ="submit"/>
                            </div>
                            </td>
                        </tr>
                        </table>
                    </div>
                    </div>

                <$control.Form(formEnd = "true")$>
                <script type="text/javascript" language="javascript">
                    jq$(document).ready(function () { jq$('#idRequestForm').FormValidate(); });
                </script>
                <div class="clearEndContainer"></div>
                <$control.Divs(designDivsEnd = "true")$>
            </div>
            <div class="cornersContainer">
                <$control.Divs(cornersDivsBottom = "true")$>
            </div>
            </div>
        <$control.Divs(designDivsEnd = "true")$>
        </div>
        <div class="cornersContainer">
        <$control.Divs(cornersDivsBottom = "true")$>
        </div>

    <$endif$>
  <$endif$>
<$endif$>

