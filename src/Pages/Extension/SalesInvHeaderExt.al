pageextension 52122402 "Sales Invoice Header EXT" extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(Post)
        {
            //Check if all items on Sales Invoice Lines are Checked
            trigger OnBeforeAction()
            begin
                SalesInvLines.Reset();
                SalesInvLines.SetRange("Document No.", Rec."No.");
                SalesInvLines.SetRange("Document Type", SalesInvLines."Document Type"::Invoice);
                if SalesInvLines.FindFirst() then
                    repeat

                        if SalesInvLines."Unit Price Check" = false then
                            Error('Please make sure all item prices have been checked before posting');
                    until SalesInvLines.Next() = 0;
            end;
        }

    }

    var
        SalesInvLines: Record "Sales Line";
}