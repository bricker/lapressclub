﻿<div class="text" id="waitingForPaymentMessageBoxGroup" style="display:none">
    <$Model.InvoiceAndPaymentList.Text.WaitingForPayment$>
</div>

<div class="text" id="noInvoicesMessageBoxGroup" style="display:none">
	<$Model.InvoiceAndPaymentList.Text.NoInvoicesSelectedLabel$>
</div>

<div class="text" id="recurringInvoiceOnlyMessageBoxGroup" style="display:none">
	<$Model.InvoiceAndPaymentList.Text.PayRecurringInvoiceLabel$>
</div>

<div class="text" id="paymentInstructionsBoxGroup" style="display:none">
  <$Model.GeneralPaymentInstructions$>
</div>

<div class="buttons" id="payButtonsMessageBoxGroup" style="display:none">
  <$if (Model.InvoiceAndPaymentList.PayOnlineBool)$>
		<input class="button" id="payOnlineButton" name="payOnlineButton" <$if (Model.InvoiceAndPaymentList.IsInWidgetMode)$>onclick="InvoiceListRenderer.DisablePaymentButtonsInWidget()"<$endif$> type="submit" value="<$Model.InvoiceAndPaymentList.Text.PayOnlineButtonLabel$>"/>
	<$endif$>
	<$if (Model.InvoiceAndPaymentList.PayByCreditCardBool)$>
		<input class="button" id="payByCreditCardButton" name="payByCreditCardButton" <$if (Model.InvoiceAndPaymentList.IsInWidgetMode)$>onclick="InvoiceListRenderer.DisablePaymentButtonsInWidget()"<$endif$> type="submit" value="<$Model.InvoiceAndPaymentList.Text.PayByCreditCardButtonLabel$>"/>
	<$endif$>
	<$if (Model.InvoiceAndPaymentList.PayByExpressBool)$>
		<input class="button" id="payByExpressButton" name="payByExpressButton" <$if (Model.InvoiceAndPaymentList.IsInWidgetMode)$>onclick="InvoiceListRenderer.DisablePaymentButtonsInWidget()"<$endif$> type="submit" value="<$Model.InvoiceAndPaymentList.Text.PayByExpressButtonLabel$>"/>
	<$endif$>	
	<$if (Model.InvoiceAndPaymentList.IsOpenRecurringDocumentsExists)$>
		<$Model.InvoiceAndPaymentList.Text.InvoicesSelectedRecurringNote$>
	<$endif$>
</div>

<div class="buttons" id="payByCreditOnlyButtonsMessageBoxGroup" style="display:none">
	<input class="button" id="payButton" name="payButton" onclick="InvoiceListRenderer.PreventNewWindow()" type="submit" value="<$Model.InvoiceAndPaymentList.Text.PayButtonLabel$>"/>
</div>
<input id="selectedDocsHidden" name="selectedDocsHidden"  type="hidden" value=""/>
<input id="selectedCreditHidden" name="selectedCreditHidden"  type="hidden" value=""/>