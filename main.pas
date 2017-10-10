Program Practico13;
uses UOlista,Crt;
var
  lista:OLista;
  c:Char;
  info:TPersona;
procedure Menu;
begin
  Writeln('Presione un numero para seleccionar una opcion del menu:');
  Writeln('1. Iniciarlizar una lista.');
  Writeln('2. Insertar una persona a la lista.');
  Writeln('3. Suprimir una persona de la lista.');
  Writeln('4. Mostrar.');
  Writeln('5. Salir.');
  Writeln();
end;
begin
  ClrScr;
  Menu;
  c:= ReadKey;
  while c <> '5' do
  begin
    ClrScr;
    Menu;
    case c of
      '1':begin
            if NOT (lista.estaIinicializada) then
            begin
              lista.Inicializar;
              Writeln('Lista inicializada.');
            end
            else
            begin
              Writeln('La lista ya fue inicializada.');
            end;
          end;
      '2':begin
            if (lista.estaIinicializada) then
            begin
              Write('Nombre: ');
              Readln(info.nombre);
              Write('Apellido: ');
              Readln(info.apellido);
              Write('DNI: ');
              Readln(info.dni);
              lista.Insertar(info);
              Writeln('Persona Cargada.');
            end
            else
            begin
              Writeln('Primero inicialize la lista.');
            end;
          end;
      '3':begin
            if (lista.estaIinicializada) then
            begin
              lista.Eliminar;
              Writeln('Cabeza de la lista borrada.');
            end
            else
            begin
              Writeln('Primero inicialize la lista.');
            end;
          end;
      '4':begin
            if (lista.estaIinicializada) then
            begin
              lista.Mostrar;
            end
            else
            begin
              Writeln('Primero inicialize la lista.');
            end;
          end;
    end;
    c:= ReadKey;
  end;
end.
