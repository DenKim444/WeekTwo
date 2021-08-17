enum 50100 "Bonus Status"
{
    Extensible = true;
    value(0; Open)
    {
        Caption = 'Open';
    }
    value(1; Closed)
    {
        Caption = 'Closed';
    }
}
enum 50101 "Bonus Type"
{
    Extensible = true;

    value(0; "All Items")
    {
        Caption = 'All Items';
    }
    value(1; Item)
    {
        Caption = 'Item';
    }
}