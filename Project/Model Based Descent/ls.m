function[line_success,tau] = ls(xk,dk,gk,eta,funcType)

Nmax=100;
    tau=1;
    %dk=-gk;
    f1=functionsList(xk+tau*dk,funcType);
    f2=functionsList(xk,funcType) + eta*tau*(dk)'*gk;
    Nset=2.^(0:Nmax);
    if(f1<f2)
        line_success=true;
        for ii=1:Nmax
            tau=Nset(ii);
            if(functionsList(xk+tau*dk,funcType)>=functionsList(xk,funcType) + eta*tau*(dk)'*gk)
                break;
            end
        end
        tau=tau/2;
    else
        line_success=false;
        Nset=2.^(0:-1:-Nmax);
        for ii=1:Nmax
            tau=Nset(ii);
            if(functionsList(xk+tau*dk,funcType)<functionsList(xk,funcType) + eta*tau*(dk)'*gk)
                break;
            end
        end
        %             while(sum(Nset==tau)~=0&&func_eval(x+tau*dk',type)>=func_eval(x,type)+eta*tau*(dk)'*gk)
        %                 tau=tau/2;
        %             end
        if(functionsList(xk+tau*dk,funcType)<functionsList(xk,funcType) + eta*tau*(dk)'*gk)
            line_success=true;
        end
    end
    
% dk = dk';
% x = x';
% gk = gk';
% Nmax=100;
%     tau=1;
%     dk=-gk;
%     f1=functionsList(x+tau*dk',type);
%     f2=functionsList(x,type)+eta*tau*(dk)'*gk;
%     Nset=2.^(0:Nmax);
%     if(f1<f2)
%         
%         line_success=true;
%         for ii=1:Nmax
%             tau=Nset(ii);
%             if(functionsList(x+tau*dk',type)>=functionsList(x,type)+eta*tau*(dk)'*gk)
%                 break;
%             end
%         end
%         %             while(sum(Nset==tau)~=0&&
%         %                 tau=tau*2;
%         %             end
%         tau=tau/2;
%     else
%         line_success=false;
%         Nset=2.^(0:-1:-Nmax);
%         for ii=1:Nmax
%             tau=Nset(ii);
%             if(functionsList(x+tau*dk',type)<functionsList(x,type)+eta*tau*(dk)'*gk)
%                 break;
%             end
%         end
%         %             while(sum(Nset==tau)~=0&&functionsList(x+tau*dk',type)>=functionsList(x,type)+eta*tau*(dk)'*gk)
%         %                 tau=tau/2;
%         %             end
%         if(functionsList(x+tau*dk',type)<functionsList(x,type)+eta*tau*(dk)'*gk)
%             line_success=true;
%         end
%     end
end