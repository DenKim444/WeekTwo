page 52122406 "Bonus Ledger Entry"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bonus Entry";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Editable = false;
    Caption = 'Bonus Entries';

    layout
    {
        area(Content)
        {
            repeater(Bonus)
            {
                field(EntryNo; Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Entry Number';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field';
                    ApplicationArea = All;
                }
                field("Bonus Code"; Rec."Bonus No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Bonus Code';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Document Number from the Sales Invoice';
                }
                field(Item; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies our items in the sales invoice';
                }
                field("Bonus Amount"; Rec."Bonus Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the calculated Bonus Amount';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

}