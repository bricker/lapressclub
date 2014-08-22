<$if (Model.ShowInvoice)$>
    <$if (Model.InvoiceAndPayment.AvailablePayOnlineBool)$>
        <div class="text">
	    	<$Model.InvoiceDetails.Text.PaymentInstructions$>
		</div>
    <$else$>
        <div class="text">
            <$Model.InvoiceDetails.Text.PaymentInstructions$>
        </div>        
        <div class="text">
            <$Model.InvoiceAndPayment.Text.WaitingForPayment$>
        </div>
    <$endif$>
	<$if (Model.InvoiceDetails.IsRecurringDocumentBool)$>
		<div class="text">
			<$Model.InvoiceDetails.Text.RecurringDescription$>
		</div>
    <$endif$>
    <$if (Model.InvoiceAndPayment.AvailablePayOnlineBool)$>
	    <div id="payButtonsMessageBoxGroup" class="buttons">
		    
			<$if (Model.InvoiceAndPayment.PayOnlineBool)$>
				<input type="submit" class="button" value="<$Model.InvoiceAndPayment.Text.PayOnlineButtonLabel$>" name="payOnlineButton" id="payOnlineButton" <$if (Model.InvoiceAndPayment.IsInWidgetMode)$>onclick="InvoiceDetailsRenderer.DisablePaymentButtonsInWidget();"<$endif$>>
			<$endif$>

			<$if (Model.InvoiceAndPayment.PayByCreditCardBool)$>
				<input type="submit" class="button" value="<$Model.InvoiceAndPayment.Text.PayByCreditCardButtonLabel$>" name="payByCreditCardButton" id="payByCreditCardButton" <$if (Model.InvoiceAndPayment.IsInWidgetMode)$>onclick="InvoiceDetailsRenderer.DisablePaymentButtonsInWidget();"<$endif$>>
			<$endif$>

			<$if (Model.InvoiceAndPayment.PayByExpressBool)$>
				<input type="submit" class="button" value="<$Model.InvoiceAndPayment.Text.PayByExpressButtonLabel$>" name="payByExpressButton" id="payByExpressButton" <$if (Model.InvoiceAndPayment.IsInWidgetMode)$>onclick="InvoiceDetailsRenderer.DisablePaymentButtonsInWidget();"<$endif$>>
			<$endif$>            
            
	    </div>
    <$endif$>
<$endif$>

<$if (Model.ShowDonation)$>
    <$Model.InvoiceAndPayment.Text.PaymentInstructions$>
	<div class="buttons" id='payButtonsMessageBoxGroup'>
		<$if (Model.InvoiceAndPayment.PayOnlineBool)$>
			<input type="submit" class="button" value="<$Model.InvoiceAndPayment.Text.PayOnlineButtonLabel$>" name="payOnlineButton" id="payOnlineButton">
		<$endif$>

		<$if (Model.InvoiceAndPayment.PayByCreditCardBool)$>
			<input type="submit" class="button" value="<$Model.InvoiceAndPayment.Text.PayByCreditCardButtonLabel$>" name="payByCreditCardButton" id="payByCreditCardButton">
		<$endif$>

		<$if (Model.InvoiceAndPayment.PayByExpressBool)$>
			<input type="submit" class="button" value="<$Model.InvoiceAndPayment.Text.PayByExpressButtonLabel$>" name="payByExpressButton" id="payByExpressButton">
		<$endif$>

			<input type="submit" class="button" value="<$Model.InvoiceAndPayment.Text.CancelButtonLabel$>" name="cancelDonationButton" id="cancelDonationButton">
	</div>
<$endif$>
