%
% q1,x1,y1 -> smooth line
% q2,x2,y2 -> points
%
function profXZ2(q1,x1,z1,q2,x2,z2,scale,qty,qtyname,al,xw,zw,y)

xq1 = x1 + scale*q1;
xq2 = x2 + scale*q2;

%------------------------------
           casename='WMC'  ;
if(al==45) casename='WMC45'; end;
if(al==90) casename='WMC90'; end;
%------------------------------

%figure;
figure;fig=gcf;ax=gca; hold on;grid on;
title([casename,' ',qtyname,' Profile, y=',num2str(y)],'fontsize',14);
ax.XScale='linear';
ax.YScale='linear';
xlabel(['$$x + $$',qtyname]);
ylabel('$$z$$');

daspect([1,1,1]);
set(fig,'position',[585,1e3,1e3,500])

% bottom wall
%p=plot(xw,yw,'k-.','linewidth',1.5);
%p.HandleVisibility='off';

% quantity 1
%p=plot(xq1,y1,'ko','linewidth',1.0);
for i=1:1:size(xq1,1)
	p=plot(xq1(i,:),z1(i,:),'b-','linewidth',1.0);
	%p.HandleVisibility='off';
end
%p.HandleVisibility='on';
%p.DisplayName=['Nek'];

p=plot(xq2,z2,'ro','linewidth',1.0);
%p.HandleVisibility='on';
%p.DisplayName=['Snyder, 1994'];

%lgd=legend('location','southeast');lgd.FontSize=14;
%------------------------------
figname=[casename,'-XZ-',qty];
saveas(fig,figname,'jpeg');
%------------------------------
end