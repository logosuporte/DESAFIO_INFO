unit Modell.Cliente;


interface
uses SysUtils;

type
  TClientes = Class
  private
    fLogradouro: String;
    fBairro: String;
    fEmail: String;
    fCPF: String;
    fCep: String;
    fNumero: integer;
    fIdentidade: String;
    fComplemento: String;
    fNome: string;
    fCidade: String;
    fPais: String;
    fEndereco: String;
    fEstado: String;
    fTelefone: String;
  public
  constructor Create;
  destructor Destroy; override;

  property Nome       :string  read fNome         write fNome;
  property Identidade :String  read fIdentidade   write fIdentidade ;
  property CPF        :String  read fCPF          write fCPF        ;
  property Telefone   :String  read fTelefone     write fTelefone   ;
  property Email      :String  read fEmail        write fEmail      ;
  property Endereco   :String  read fEndereco     write fEndereco   ;
  property Cep        :String  read fCep          write fCep        ;
  property Logradouro :String  read fLogradouro   write fLogradouro ;
  property Numero     :integer read fNumero       write fNumero     ;
  property Complemento:String  read fComplemento  write fComplemento;
  property Bairro     :String  read fBairro       write fBairro     ;
  property Cidade     :String  read fCidade       write fCidade     ;
  property Estado     :String  read fEstado       write fEstado     ;
  property Pais       :String  read fPais         write fPais       ;
  End;

implementation

{ TClientes }

constructor TClientes.Create;
begin

end;

destructor TClientes.Destroy;
begin

  inherited;
end;


end.


