classdef f6 < PROBLEM
    methods
        function Setting(obj)
            obj.N = 100;            % Population size
            obj.M = 2;              % Number of objectives
            % obj.D = 30;             % Number of decision variables, adjust as needed
            obj.lower    = zeros(1, obj.D);  % Lower bounds of decision variables
            obj.upper    = ones(1, obj.D);   % Upper bounds of decision variables
            obj.encoding = 'real';  % Encoding type
        end

        function Population = Initialization(obj)
            PopDec = unifrnd(repmat(obj.lower, obj.N, 1), repmat(obj.upper, obj.N, 1));
            Population = obj.Evaluation(PopDec);
        end
        
        function PopObj = CalObj(obj, PopDec)
            n = size(PopDec, 2);
            J1 = 3:2:n; 
            J2 = 2:2:n; 
            x1 = PopDec(:, 1);
            y = PopDec - x1;  
            
            term1_J1 = sum((4*y(:, J1).^2 - cos(8*pi*y(:, J1)) + 1).^2, 2);
            term2_J2 = sum((4*y(:, J2).^2 - cos(8*pi*y(:, J2)) + 1).^2, 2);

            PopObj(:, 1) = x1 + (2 / numel(J1)) * term1_J1;
            PopObj(:, 2) = 1 - sqrt(x1) + (2 / numel(J2)) * term2_J2;
        end
    end
end
