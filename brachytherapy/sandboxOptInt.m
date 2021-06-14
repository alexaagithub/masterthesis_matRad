classdef sandboxOptInt
    %UNTITLED2 A trial to solve a simple optimization problem with 1,0
    %   Detailed explanation goes here
    
    properties
        wInit
        OptiGoals % supports squared deviation and squared overdosing
        parameters
        penalty
        doseInfluenceMatrix
        
    end
    methods
        
        function obj = untitled2(cst,dij)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            if nargin == 0
                obj = constructSimpleExample();
            end
            obj.wInit = 0.5;
            obj.doseInfluenceMatrix = dij.physicalDose;
            
        end
    end
    
    
    
    methods(Static)
        function wResult = optimization()
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
            
        
        end
        
        function obj = constructSimpleExample()
            % get simple seedpoints and dosepoints
                % get dose points
            XseedPoints = [1.5,1.5];
            YseedPoints = [1.5,3.5];
            
                % get seed points
            [XGrid,YGrid] = meshgrid(0:3,0:5);
            XdosePoints = reshape(XGrid,1,[]);
            YdosePoints = reshape(YGrid,1,[]);
            
            % calc dose influence matrix
            Xdiff = XdosePoints'*ones(1,length(XseedPoints)) - ones(length(XdosePoints),1)*XseedPoints;
            Ydiff = YdosePoints'*ones(1,length(YseedPoints)) - ones(length(YdosePoints),1)*YseedPoints;
            Zdiff = 0;
            DistanceMatrix = sqrt(Xdiff.^2+Ydiff.^2+Zdiff.^2);
                % Calc matrix
            physicalDose = getPointDose1D(dij.basedata,DistanceMatrix,pln.propDoseCalc.durationImplanted);
            
            obj.doseInfluenceMatrix = physicalDose;
            obj.OptiGoals = {'squaredDeviation','squaredOverdose'};
            
        end
        
        function plot = plotResult()
            
        end
                
    end
end

