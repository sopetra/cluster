% v [in]    = pocetni podaci koje treba klasterirati
% pi [in]   = pocetna particija, sadrzi vrijednosti 1,...,k; 
%             program pretpostavlja da je netrivijalan vektor, tj.
%             vec imamo pocetnu particiju 

% m, n [in] = broj redaka, stupaca matrice podataka
% Q [out]   = povijest funkcije cilja kroz petlju 
% pos [out] = konacna particija 

% racuna 2-particiju bipartitnog grafa

function [ Q, pos ] = means ( v, m, n, pi, k )
  x = zeros (m+1,k);
  % inicijalizacija pocetnih centroida
  for i = 1:n
    for j = 1:k
      if pi(i) == j 
        x(1:m,j) = x(1:m,j) + v(1:m,i); % "centroid"
        x(m+1,j) = x(m+1,j) + 1; % kardinalitet
      end
    end
  end
  for j = 1:k
    if x(m+1,j) ~= 0
      x(1:m,j) = x(1:m,j)./x(m+1,j);
    end
  end
  test2 = 1;
  test1 = 0;
  l = 0;
  while test2 == 1
    test2 = 0;
    l = l + 1;
    Q(l) = 0;
    for i = 1 : n
      min = norm(v(:,i)-x(1:m,pi(i)),2);
      % minimum postavljamo na udaljenost od maticnog centorida
      Q(l) = Q(l) + min*min;
      for j = 1 : k
        nrm = norm(v(:,i)-x(1:m,j),2);
        if nrm < min  
          test2 = 1; % i-ti element sigurno mijenja klaster
          test1 = 1;
          min = nrm;
          j0 = j; %j0 je indeks klastera u koji ce el. otici
        end
      end
      
      if test1 == 1
        x(m+1,pi(i)) = x(m+1,pi(i)) - 1;
        x(m+1,j0) = x(m+1,j0) + 1;
        pi(i) = j0;
        test1 = 0;
      end
    end
   % prosli smo sve elemente pa mozemo updateat centroide (kardinaliteti su vec sredjeni)
   % umjesto prolazenja kroz petlju ponovo, moze se pamtiti dodatni "tekuci" y (mala dimenzija u odnosu na n) kako bi smanjili broj prolazaka kroz petlju
    if test2 == 0 
      break; return;
    else 
      x(1:m,:) = zeros(m,k);
      
      for i = 1:n
        for j = 1:k
          if pi(i) == j 
            x(1:m,j) = x(1:m,j) + v(1:m,i); % "centroid"
          end
        end
      end
  
      for j = 1:k
        if x(m+1,j) ~= 0
          x(1:m,j) =  x(1:m,j)./x(m+1,j);
        end
      end
      
    end
    
  end
  pos = pi;

end
