% Reset console, variables and figures
clc; clear variables; close all;

%% 
% Configurable parameters
GenerateWAVs = false;
PrintPlots = true;

%% 
% Original file names
SongNameWAV = '1 - Song To A Bottle - Original WAV.wav';
SongName320 = '2 - Song To A Bottle - Original MP3 320 kbps.wav';
SongName128 = '4 - Song To A Bottle - Original MP3 128 kbps.wav';
SongName64  = '6 - Song To A Bottle - Original MP3 64 kbps.wav';

% Names of the files to generate
SongDiffName320 = '3 - Song To A Bottle - Diff MP3 320 kbps.wav';
SongDiffName128 = '5 - Song To A Bottle - Diff MP3 128 kbps.wav';
SongDiffName64  = '7 - Song To A Bottle - Diff MP3 64 kbps.wav';

% Read files and save sampling frequencies
[SongWAV, SongWAVFs] = audioread(SongNameWAV);
[Song320, Song320Fs] = audioread(SongName320);
[Song128, Song128Fs] = audioread(SongName128);
[Song64,  Song64Fs ] = audioread(SongName64);

% Find maximum duration
MinDuration = min([length(SongWAV) length(Song320) ...
    length(Song128) length(Song64)]);

% Diff
SongDiff320 = SongWAV(1:MinDuration,:) - Song320(1:MinDuration,:);
SongDiff128 = SongWAV(1:MinDuration,:) - Song128(1:MinDuration,:);
SongDiff64  = SongWAV(1:MinDuration,:) - Song64(1:MinDuration,:);

%%
% Save Diff files
if (GenerateWAVs)
    audiowrite(SongDiffName320, SongDiff320, Song320Fs);
    audiowrite(SongDiffName128, SongDiff128, Song128Fs);
    audiowrite(SongDiffName64, SongDiff64, Song64Fs);
end

%%
if(PrintPlots)
    % Print 320 kbps plots
    figure; set(gcf, 'Name', 'Original WAV vs. MP3 320 kbps');
    subplot(3, 2, 1);
    plot(SongWAV(:, 1));
    title('Original WAV (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 2);
    plot(SongWAV(:, 2)); 
   title('Original WAV (Right Channel)'); ylim([-1 1]);
    subplot(3, 2, 3);
    plot(Song320(:, 1));
    title('MP3 320 (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 4);
    plot(Song320(:, 1));
    title('MP3 320 (Right Channel)'); ylim([-1 1]);
    subplot(3, 2, 5);
    plot(SongDiff320(:, 1));
    title('Difference (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 6);
    plot(SongDiff320(:, 1)); 
   title('Difference (Right Channel)'); ylim([-1 1]);

    % Print 128 kbps plots
    figure; set(gcf, 'Name', 'Original WAV vs. MP3 128 kbps');
    subplot(3, 2, 1);
    plot(SongWAV(:, 1));
    title('Original WAV (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 2);
    plot(SongWAV(:, 2));
    title('Original WAV (Right Channel)'); ylim([-1 1]);
    subplot(3, 2, 3);
    plot(Song128(:, 1));
    title('MP3 128 (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 4);
    plot(Song128(:, 1));
    title('MP3 128 (Right Channel)'); ylim([-1 1]);
    subplot(3, 2, 5);
    plot(SongDiff128(:, 1));
    title('Difference (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 6);
    plot(SongDiff128(:, 1));
    title('Difference (Right Channel)'); ylim([-1 1]);

    % Print 64 kbps plots
    figure; set(gcf, 'Name', 'Original WAV vs. MP3 64 kbps');
    subplot(3, 2, 1);
    plot(SongWAV(:, 1));
    title('Original WAV (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 2);
    plot(SongWAV(:, 2));
    title('Original WAV (Right Channel)'); ylim([-1 1]);
    subplot(3, 2, 3);
    plot(Song64(:, 1));
    title('MP3 64 (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 4);
    plot(Song64(:, 1));
    title('MP3 64 (Right Channel)'); ylim([-1 1]);
    subplot(3, 2, 5);
    plot(SongDiff64(:, 1));
    title('Difference (Left Channel)'); ylim([-1 1]);
    subplot(3, 2, 6);
    plot(SongDiff64(:, 1));
    title('Difference (Right Channel)'); ylim([-1 1]);
end