% A [in]    = matrica wxd
% w, d [in] = broj rije�i, dokumenata
% flag [out] = vra�a 0 ako je rang matrice >= 2
% z [out] = kona�na particija: z(1:w) = rije�i, z(w+1:w+d) = dokumenti

function [ z, flag ] = bipart( A, w, d )
  D1 = zeros(w,1);
  D2 = zeros(d,1);
  for i = 1:w 
    for j = 1:d
      D1(i) += A(i,j);
    end 
  end
  for j = 1:d 
    for i = 1:w
      D2(i) += A(i,j);
    end 
  end
  % normaliziranje A  
  for i = 1:w
    A(i,1:d) = A(i,1:d)./sqrt(D1(i));
  end
  for j = 1:d
    A(1:w,j) = A(1:w,j)./sqrt(D2(j));
  end  
  
  % kasnije 'econ' u svd jer znamo da �e biti w>>d
  [ U, S, V ] = svd(A);

  for i = 1:d % ra�unanje ranga matrice A
    if S(i,i)==0
      r = i-1;
    end
  end
  
  if r==1
    flag = 1; z = zeros(1,d+w);
    return;
  end
  flag = 0;
  
  % svd ra�una u padaju�em poretku, nama trebaju 2. vektori tj oni koji idu uz drugu najve�u singularnu vrijednost
  
  z = [ D1'.*U(:,2); D2'.*V(:,2) ]; % provjerit ovde da mo�da ne triba transponirano
  pi = ( 2, 1, w+d );
  [ Q, pos ] = means ( z, 1, w+d, pi, 2 );
  
  z = pos;
  pos(1:w)
  pos(w+1:w+d)
  
end
