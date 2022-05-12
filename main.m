%Ime datoteke s dokumentima
filename="1.txt";
%filename="2.txt";
%filename="3.txt";
%filename="4.txt";
%filename="5.txt";

%Broj clustera
k=3;

%Broj dokumenata u svakoj skupini
orig=[50,50,50];

%File u koji cemo pohraniti clustere
fid = fopen('1cl.txt', 'w');
%fid = fopen('2cl.txt', 'w');
%fid = fopen('3cl.txt', 'w');
%fid = fopen('4cl.txt', 'w');
%fid = fopen('5cl.txt', 'w');

%Obrada dokumenata
str=extractFileText(filename);
textData=split(str,newline);
documents=tokenizedDocument(textData);
documents=removeStopWords(documents);
documents=erasePunctuation(documents);
documents=normalizeWords(documents);

bag=bagOfWords(documents);
M=tfidf(bag,documents);
%A je matrica susjedstva
A=(full(M))';
%izbacivanje nulredaka ("nevazne rijeci")
A = A(~all(A == 0, 2),:);
[m,n]=size(A);
%z = bipart(A, m, n);
w = multipart(A, m, n, k);

%racunamo kardinalitet clustera
%mijenjamo im poredak u skladu s rezultatom
dim=1;
for i=1:k
    cl(i)=0;
    for j=1:n
        l=1;
        if w(m+j)==i
            C(dim)=textData(j);
            cl(i)=cl(i)+1;
            dim=dim+1;
        end
    end
end

%printanje dokumenata u originalnom poretku
%textData

%pohranjivanje dokumenata u novom poretku u file
d=1;
    for i = 1:k
        D='';
        for j=1:cl(i)
            D=D+C(d);
            d=d+1;
        end
        D;
        s(i)=string(D);
        fprintf('\n');
        fprintf(fid, '%s\n', D);
        fprintf(fid, '\n\n\n');
    end
fclose(fid);

%obrada dokumenata u svakom clusteru
for i=1:k
    doc(i)=tokenizedDocument(s(i));
    doc(i)=removeStopWords(doc(i));
    doc(i)=erasePunctuation(doc(i));
    doc(i)=normalizeWords(doc(i));
    bagg(i)=bagOfWords(doc(i));
    %printanje kljucnih rijeci
    topkwords(bagg(i),10)
    %medusobno usporediti kljucne rijeci u clusterima
    
    %crtanje wordcloudova
    %figure
    %wordcloud(doc(i),'HighlightColor', [0.5412 0.1686 0.8863])
    
end

%printanje kardinaliteta clustera
cl

%koliko elemenata pojedine skupine je u kojem clusteru
d=m+1;
for j=1:k
    wn=w(d:(d-1+orig(j)))';
    [GC,GR] = groupcounts(wn);
    
    %printanje vrijednosti
    %GC
    %GR
    d=d+orig(j);
end

