%%  #plotting
model = @(b,x) (b(1)*(b(3) - ((b(3)-1)*exp(-b(2)*x(:,1)))));
%model = @(b,x) (b(1)*exp(-(b(2)*x(:,1)))); 
%model = @(b,x) (b(1) - exp(-(b(2)*x(:,1)))); 
%model = @(b,x) (b(1) + b(2)*x(:,1));
X = sort(a);

%y_pred = model(mdl,a);
y_lower = model(ci2(1,:),a);
y_upper = model(ci2(2,:),a);

y1 = sort(y_lower);
y11 = sort(y_lower,'descend');
y2 = sort(y_upper);
y22 = sort(y_upper,'descend');
%plot(a,y_pred,'b');
%hold on
figure
hold on
scatter(a,y_lower,'b');
scatter(a,y_upper,'g');
%%
fill([X', fliplr(X')],[y2', fliplr(y1')],'r');
hold off

set(gca, 'YAxisLocation','left');
xlabel('Dose');
ylabel('Response');

print('MONP_Tcc_cluster_III','-dpng','-r300');