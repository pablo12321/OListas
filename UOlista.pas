unit UOlista;

interface
type
  TPersona =Record
              nombre:String;
              apellido:String;
              dni:String;
            end;
  TNodo = Record
          info:TPersona;
          back,next:^TNodo;
          end;
  OLista = Object
             q,u:^TNodo;
             procedure Inicializar;
             function estaIinicializada:Boolean;
             procedure Insertar(info:TPersona);
             procedure Eliminar;
             procedure Mostrar;
           end;
implementation
procedure OLista.Inicializar;
var
  fict1,fict2:^TNodo;
begin
  new(fict1);
  new(fict2);
  q:=fict1;
  u:=fict2;
  fict1^.info.nombre := '';
  fict1^.info.apellido := '';
  fict1^.info.dni := '';
  fict1^.back := nil;
  fict1^.next := fict2;
  fict2^.info.nombre := '';
  fict2^.info.apellido := '';
  fict2^.info.dni := '';
  fict2^.back := fict1;
  fict2^.next := nil;
end;
function OLista.estaIinicializada:Boolean;
begin
  estaIinicializada:= q <> nil;
end;
procedure OLista.Insertar(info:TPersona);
var
 aux:^TNodo;
begin
  new(aux);
  aux^.info := info;
  aux^.next := u;
  aux^.back := u^.back;
  (u^.back)^.next := aux;
  u^.back := aux;
end;
procedure OLista.Mostrar;
var
  i:Integer;
  aux:^TNodo;
begin
  i:=1;
  aux := q^.next;
  Writeln('Lista:');
  while (aux^.next <> nil) do
  begin
    Writeln(i,') Nombre: ',aux^.info.nombre,'.  Apellido: ',aux^.info.apellido,'. DNI: ',aux^.info.dni);
    aux := aux^.next;
    i+= 1;
  end;
end;
procedure OLista.Eliminar;
var aux:^TNodo;
begin
  aux := (q^.next)^.next;//segundo elem
  if (aux <> nil) then
  begin
    dispose(q^.next);
    q^.next := aux;
    aux^.back := q;
  end;
end;
end.
