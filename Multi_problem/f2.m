classdef f2 < PROBLEM
    methods
        function Setting(obj)
            obj.N = 100;            % Population size
            obj.M = 2;              % Number of objectives
            % obj.D = 30;             % Number of decision variables, adjust as needed
            obj.lower    = [0, -ones(1, obj.D-1)];  % Lower bounds of decision variables
            obj.upper    = [1, ones(1, obj.D-1)];   % Upper bounds of decision variables
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

            
            term1_J1 = sum((PopDec(:, J1) - sin(6*pi*x1 + pi*(J1/n))).^2, 2);
            term2_J2 = sum((PopDec(:, J2) - sin(6*pi*x1 + pi*(J2/n))).^2, 2);

            PopObj(:, 1) = x1 + (2 / numel(J1)) * term1_J1;
            PopObj(:, 2) = 1 - sqrt(x1) + (2 / numel(J2)) * term2_J2;
        end

    end
end
