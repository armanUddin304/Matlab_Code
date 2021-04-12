figure
plot(X(:,1),X(:,2),'*')
title 'Fisher''s Iris Data';
xlabel 'Petal Lengths (cm)'; 
ylabel 'Petal Widths (cm)';
 
dsp=statset('Display','final');
[idx,C]=kmeans(X,4);
figure
plot(X(idx==1,1),X(idx==1,2),'r*','MarkerSize',8)
hold on
plot(X(idx==2,1),X(idx==2,2),'b*','MarkerSize',8)
hold on
plot(X(idx==3,1),X(idx==3,2),'g*','MarkerSize',8)
hold on
plot(X(idx==4,1),X(idx==4,2),'y*','MarkerSize',8)
hold on
plot(C(:,1),C(:,2),'KX',...
     'MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Centroids',...
   'Location','NW')
title 'Cluster Assignments and centroids '
hold off
