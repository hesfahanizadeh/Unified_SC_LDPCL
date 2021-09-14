/*****************************************/
/* Target: Generate Q matrix for local code construction*/
/* By: Eshed Ram (eshed.ram@gmail.com)                */
/* Update: 09/14/2021                                 */
/*****************************************/
function Q = QMatrix(l,r,i)
if(i<0 || i>= l)
    error('Invalid value for i');
end
Q = ones(l,r); Q(i+1,:) = 0;
end

