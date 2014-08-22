<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>


    <table class="donationGoalProgressLabels">
        <tr class="donationGoalProgressCollected">
            <th class="donationGoalCollectedTitleContainer"><$Model.Text.CollectedTitle$></th>
            <td class="donationGoalCollectedValueContainer"><$Model.CollectedAmount$></td>
        </tr>
        <tr class="donationGoalProgressAmount">
            <th class="donationGoalAmountTitleContainer"><$Model.Text.GoalAmountTitle$></th>
            <td class="donationGoalAmountValueContainer"><$Model.GoalAmount$></td>
        </tr>
    </table>
    <div class="progressBar">
        <div class="progressBarRight">
            <$Model.CollectedPercent$>%
        </div>
        <div class="progressBarLeft">
            <table cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td class="donationGoalProgressBarLeftPart" width="<$Model.PercentForBar$>%"><span></span></td>
                    <td class="donationGoalProgressBarRightPart" width="<$Model.PercentForBarLeft$>%"></td>
                </tr>
            </table>
        </div>
    </div>

    <$if (Model.Description && Model.Description != "")$>
        <div class="donationGoalNotesContainer">
            <$Model.Description$>
        </div>
    <$endif$>

    <$if (Model.CanAcceptDonations)$>
        <div class="donationGoalButton">
            <$if (Model.IsAdminMode)$>
            <input type="button" class="typeButton" value="<$Model.Text.DonateButtonText$>" onclick="window.location.href='<$Model.Urls.Donate$>'" />
            <$else$>
            <noscript>
                <a class="donationGoalLink" href="<$Model.Urls.Donate$>">
                    <$Model.Text.DonateButtonText$>
                </a>
            </noscript>
            <script language="javascript" type="text/javascript">
                document.write('<input type="button"class="typeButton" value="<$Model.Text.DonateButtonText$>" onclick="window.location.href=\'<$Model.Urls.Donate$>\'" />');
            </script>
            <$endif$>
        </div>
    <$endif$>


<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>






