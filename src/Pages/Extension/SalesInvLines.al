pageextension 52122401 "Sales Invoice Subform EXT" extends "Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Unit Price Check"; Rec."Unit Price Check")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the items checked manually before posting Sales Invoice';
            }
        }

    }

}