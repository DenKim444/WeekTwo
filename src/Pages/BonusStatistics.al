/// <summary>
/// Page Bonus Statistics Details (ID 52122407).
/// </summary>
page 52122407 "Bonus Statistics Details"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Header";

    layout
    {
        area(Content)
        {
            group(Statistics)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Bonus Amount"; Rec."Bonus Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }



    var
        myInt: Integer;
}