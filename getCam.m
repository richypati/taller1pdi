function [ cam ] = getCam( )
%GETCAM Summary of this function goes here
%   Detailed explanation goes here

    %Para PC Ricardo
    cam=videoinput('winvideo',1,'RGB24_640x480');

    %Para Mac JuanPa
    %cam=videoinput('macvideo',1,'YCbCr422_1280x720');
end

