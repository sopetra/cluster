%{
Uzima lijevi i desni vektor druge najvece singularne vrijednosti normalizirane 
matrice A i provodi k-means na vektoru z=[ D^(-1/2)u_2; D^(-1/2)v_2 ]

A [in]    = matrica wxd
w, d [in] = broj rijeci, dokumenata
k [in]    = broj particija
z [out]   = konacna particija: z(1:w) = rijeci, z(w+1:w+d) = dokumenti
%}

function [ z ] = multipart( A, w, d, k )
  D1 = zeros(w,1);
  D2 = zeros(d,1);

  for i = 1:w 
    for j = 1:d
      D1(i) = D1(i) + A(i,j);
    end 
  end
  
  for j = 1:d 
    for i = 1:w
      D2(j) = D2(j) + A(i,j);
    end 
  end

  % normaliziranje A  
  for i = 1:w
    A(i,1:d) = A(i,1:d)./sqrt(D1(i));
  end
  for j = 1:d
    A(1:w,j) = A(1:w,j)./sqrt(D2(j));
  end  

  % kasnije 'econ' u svd jer znamo da ce biti w>>d
%  A
  [ U, S, V ] = svd(A);
  
  l = ceil(log2(k));
  
  % svd racuna u padajucem poretku, nama trebaju 2. vektori tj oni koji idu uz drugu najvecu singularnu vrijednost
  for i = 1:w 
      D1(i) = 1/sqrt(D1(i)); 
  end
  for j = 1:d 
      D2(j) = 1/sqrt(D2(j));
  end
  
  for i = 1:w
    Z(i,1:l) = D1(i)*U(i,2:l+1);
  end
  for i = 1:d
    Z(w+i,1:l) = D2(i)*V(i,2:l+1); 
  end
  
  %dim(z) = (w+d)*l
  %pi = ones(1,w+d);
  pi = randi( k, 1, w+d );
  
  [ Q, pos ] = means ( Z', l, w+d, pi, k );
  
  z = pos;
  pos(1:w); %
  pos(w+1:w+d); %
  
end
