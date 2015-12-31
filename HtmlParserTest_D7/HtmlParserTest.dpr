program HtmlParserTest;

uses
  Forms,
  HtmlParserTestMain in 'HtmlParserTestMain.pas' {Form16},
  DOMCore in 'htmlp\DOMCore.pas',
  Entities in 'htmlp\Entities.pas',
  Formatter in 'htmlp\Formatter.pas',
  HTMLParser in 'htmlp\HTMLParser.pas',
  HtmlReader in 'htmlp\HtmlReader.pas',
  HtmlTags in 'htmlp\HtmlTags.pas',
  WStrings in 'htmlp\WStrings.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
