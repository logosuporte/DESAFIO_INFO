unit Controller.BuscaCEP.interfaces;

interface
  type
    iCEP = Interface
      function BuscaCEP(Value:String):iCEP;
      function Logradouro(Value:String): iCEP; overload;
      function Logradouro: String; overload;
      function Bairro(Value:String): iCEP; overload;
      function Bairro: String; overload;
      function Cidade(Value:String): iCEP; overload;
      function Cidade: String; overload;
      function UF(Value:String): iCEP; overload;
      function UF: String; overload;
      function Pais(Value:String): iCEP; overload;
      function Pais: String; overload;
  End;

implementation

end.
