pageextension 52122400 "Customer List EXT" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field(Bonuses; Rec.Bonuses)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Bonuses Assigned to a Customer';
            }
        }
        // Add changes to page layout here
    }

    actions
    {

        addafter(CustomerLedgerEntries)
        {
            action(Bonus)
            {
                ApplicationArea = All;
                Caption = 'Bonuses';
                Promoted = true;
                PromotedIsBig = true;
                RunObject = page "Bonus List";
                RunPageLink = "Customer No." = field("No.");
            }

        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}