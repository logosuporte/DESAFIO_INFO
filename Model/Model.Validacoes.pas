unit Model.Validacoes;

interface
uses  System.SysUtils;

  type
    TValidacoes =  class
      class function GetStrNumber(const S: string): string;
      class function ValidaCPF(CPF: string): boolean;
    end;


implementation

{ TValidacoes }


class function TValidacoes.ValidaCPF(CPF: string): boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
  // length - retorna o tamanho da string (CPF ? um n?mero formado por 11 d?gitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11)) then
  begin
    Result := false;
    Abort;
  end;

  try
    { *-- C?lculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
      // StrToInt converte o i-?simo caractere do CPF em um n?mero
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r:1, dig10); // converte um n?mero no respectivo caractere num?rico

    { *-- C?lculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r:1, dig11);

    { Verifica se os digitos calculados conferem com os digitos informados. }
    Result :=  ((dig10 = CPF[10]) and (dig11 = CPF[11]))

  except
    Result := false
  end;
end;

{ TValidacoes }

class function TValidacoes.GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;
    Inc(vText);
  end;
end;

end.
