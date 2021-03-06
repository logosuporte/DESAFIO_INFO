unit Model.ClienteInterface;

interface
Type
  iEndereco<T> = interface;

  iCliente = interface
    function Email(Value:String): iCliente; overload;
    function Email: String; overload;
    function CPF(Value:String): iCliente; overload;
    function CPF:String overload;
    function Identidade(Value:String): iCliente; overload;
    function Identidade: String; overload;
    function Nome(Value:String): iCliente; overload;
    function Nome: string;overload;
    function Telefone(Value:String): iCliente; overload;
    function Telefone: String; overload;
    function Endereco :iEndereco<iCliente>;
    function &end: iCliente;
  end;

  iEndereco<T> = interface
    function Logradouro(Value:String): iEndereco<T>; overload;
    function Logradouro: String; overload;
    function Bairro(Value:String): iEndereco<T>; overload;
    function Bairro: String; overload;
    function Cep(Value:String): iEndereco<T>; overload;
    function Cep: String; overload;
    function Numero(Value:integer): iEndereco<T>; overload;
    function Numero: integer; overload;
    function Complemento(Value:String): iEndereco<T>; overload;
    function Complemento: String; overload;
    function Cidade(Value:String): iEndereco<T>; overload;
    function Cidade: String; overload;
    function Pais(Value:String): iEndereco<T>; overload;
    function Pais: String; overload;
    function Estado(Value:String): iEndereco<T>; overload;
    function Estado: String; overload;
    function &End:T;
  end;

implementation

end.
