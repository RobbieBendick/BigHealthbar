local core = {};

local FRAME_TEXTURE = [[Interface\AddOns\BigHealthbar\Textures\UI-TargetingFrame]]
core.TargetFrame_CheckClassification    = TargetFrame_CheckClassification
core.HealthBar_OnValueChanged           = HealthBar_OnValueChanged

--Player Frame
PlayerFrameBackground:SetHeight(41);
PlayerFrameHealthBar:SetHeight(29);
PlayerFrameHealthBar:SetPoint('TOPLEFT', 106, -22);
PlayerFrameHealthBarText:SetPoint('CENTER', 50, 5);
PlayerFrameTexture:SetTexture(FRAME_TEXTURE);

--Target Frame
TargetFrameTexture:SetTexture(FRAME_TEXTURE);
TargetFrameNameBackground:Hide();
TargetFrameHealthBar:SetPoint('TOPLEFT', 7, -22);
TargetFrameHealthBar:SetHeight(29);

function print(v)
    DEFAULT_CHAT_FRAME:AddMessage(v);
end

function TargetFrame_CheckClassification()
    core.TargetFrame_CheckClassification();
    TargetFrameTexture:SetTexture(FRAME_TEXTURE);
end

function HealthBar_OnValueChanged(v)
    core.HealthBar_OnValueChanged(v)
    if this == PlayerFrameHealthBar or this == TargetFrameHealthBar then
        local r, g, b
        if UnitIsPlayer(this.unit) then
            local _, class = UnitClass(this.unit)
            local color = RAID_CLASS_COLORS[class]
            r, g, b = color.r, color.g, color.b;
        else
            r, g, b = TargetFrameNameBackground:GetVertexColor();
        end
        this:SetStatusBarColor(r, g, b);
    end
end