classdef f1 < PROBLEM
    methods
        function Setting(obj)
            obj.N = 100;            % Population size
            obj.M = 2;              % Number of objectives
            % obj.D = 2;             % Number of decision variables
            obj.lower    = zeros(1, obj.D);  % Lower bounds of decision variables
            obj.upper    = ones(1, obj.D);   % Upper bounds of decision variables
            obj.encoding = 'real';  % Encoding type
        end

        function Population = Initialization(obj, N)
            PopDec = rand(obj.N, obj.D);
            Population = obj.Evaluation(PopDec);
        end
        
        function PopObj = CalObj(obj, PopDec)
            n = size(PopDec, 2);
            J1 = 3:2:n;
            J2 = 2:2:n;
            x1 = PopDec(:, 1);

            term1_J1 = sum((PopDec(:, J1) - x1 .* (0.5 .* (1.0 + (3 * (J1 - 2)) / (n - 2)))).^2, 2);
            term2_J2 = sum((PopDec(:, J2) - x1 .* (0.5 .* (1.0 + (3 * (J2 - 2)) / (n - 2)))).^2, 2);

            PopObj(:, 1) = x1 + (2 / numel(J1)) * term1_J1;
            PopObj(:, 2) = 1 - sqrt(x1) + (2 / numel(J2)) * term2_J2;
        end

    end
end
