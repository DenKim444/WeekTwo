page 52122405 "Bonus API"
{
    PageType = API;
    Caption = 'Bonus';
    APIPublisher = 'bonusapi';
    APIGroup = 'Bonus';
    ///APIVersion = '';
    EntityName = 'bonusapi';
    EntitySetName = 'bonusapi';
    SourceTable = "Bonus Header";
    DelayedInsert = true;
    RefreshOnActivate = true;
    ChangeTrackingAllowed = true;
    ODataKeyFields = "No.";

    layout
    {
        area(Content)
        {
            repeater("Bonus Header")
            {
                field(No; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(CustomerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                }
                field(CustomerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                    ApplicationArea = All;
                }
                field("StartingDate"; Rec."Starting Date")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field("EndDate"; Rec."End Date")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
            }

        }
    }
}