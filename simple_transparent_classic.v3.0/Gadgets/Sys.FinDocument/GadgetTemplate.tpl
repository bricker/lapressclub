 <$if (Model.DisplayAdminInfoEmptySystemPageBool)$>
        <$control.MessageBox(Text=Model.AdminInfoEmptySystemPageMessages, Info="True")$>
<$else$>
<a href="<$Model.BackUrl$>" class="backLink"><$Model.Text.BackLabel$></a>
  <div style="padding-top: 10px;">
     <$if (Model.ShowInvoice)$>
        <$Invoice()$>
     <$endif$>
     <$if (Model.ShowPayment)$>
        <$Payment()$>
     <$endif$>
     <$if (Model.ShowRefund)$>
        <$Refund()$>
     <$endif$>
     <$if (Model.ShowDonation)$>
        <$Donation()$>
     <$endif$>
  </div>
 <$endif$>