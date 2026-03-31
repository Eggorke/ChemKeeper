local ADDON_NAME = "ChemKeeper"

ChemKeeper = {}

local CK = ChemKeeper
local ICON_PATH = "Interface\\Icons\\INV_Potion_127"
local CATALOG_ROW_HEIGHT = 30
local ACTIVE_ROW_HEIGHT = 24
local ACTIVE_VISIBLE_ROWS = 18
local OVERVIEW_ROW_HEIGHT = 20
local OVERVIEW_VISIBLE_ROWS = 19
local MIN_FRAME_WIDTH = 860
local MIN_FRAME_HEIGHT = 620

local MASTER_ITEMS = {
  { itemID = 13512, label = "Flask of Supreme Power", category = "Spell", stack = 20 },
  { itemID = 13454, label = "Greater Arcane Elixir", category = "Spell", stack = 20 },
  { itemID = 21546, label = "Elixir of Greater Firepower", category = "Spell", stack = 20 },
  { itemID = 50237, label = "Elixir of Greater Nature Power", category = "Spell", stack = 20 },
  { itemID = 9264, label = "Elixir of Shadow Power", category = "Spell", stack = 20 },
  { itemID = 17708, label = "Elixir of Frost Power", category = "Spell", stack = 20 },
  { itemID = 9155, label = "Arcane Elixir", category = "Spell", stack = 20 },
  { itemID = 6373, label = "Elixir of Firepower", category = "Spell", stack = 20 },
  { itemID = 61224, label = "Dreamshard Elixir", category = "Spell", stack = 20 },
  { itemID = 61423, label = "Dreamtonic", category = "Spell", stack = 20 },
  { itemID = 8423, label = "Cerebral Cortex Compound", category = "Spell", stack = 20 },
  { itemID = 55048, label = "Elixir of Greater Arcane Power", category = "Spell", stack = 20 },
  { itemID = 55046, label = "Elixir of Greater Frost Power", category = "Spell", stack = 20 },
  { itemID = 9206, label = "Elixir of Giants", category = "Melee", stack = 20 },
  { itemID = 9224, label = "Elixir of Demonslaying", category = "Melee", stack = 20 },
  { itemID = 13452, label = "Elixir of the Mongoose", category = "Melee", stack = 20 },
  { itemID = 8949, label = "Elixir of Agility", category = "Melee", stack = 20 },
  { itemID = 9187, label = "Elixir of Greater Agility", category = "Melee", stack = 20 },
  { itemID = 12820, label = "Winterfall Firewater", category = "Melee", stack = 20 },
  { itemID = 12451, label = "Juju Power", category = "Melee", stack = 20 },
  { itemID = 12460, label = "Juju Might", category = "Melee", stack = 20 },
  { itemID = 12457, label = "Juju Chill", category = "Melee", stack = 20 },
  { itemID = 12450, label = "Juju Flurry", category = "Melee", stack = 20 },
  { itemID = 12459, label = "Juju Escape", category = "Melee", stack = 20 },
  { itemID = 12455, label = "Juju Ember", category = "Melee", stack = 20 },
  { itemID = 12458, label = "Juju Guile", category = "Melee", stack = 20 },
  { itemID = 5206, label = "Bogling Root", category = "Melee", stack = 20 },
  { itemID = 8410, label = "R.O.I.D.S.", category = "Melee", stack = 20 },
  { itemID = 8412, label = "Ground Scorpok Assay", category = "Melee", stack = 20 },
  { itemID = 8956, label = "Oil of Immolation", category = "Melee", stack = 20 },
  { itemID = 6052, label = "Nature Protection Potion", category = "Protection", stack = 20 },
  { itemID = 6048, label = "Shadow Protection Potion", category = "Protection", stack = 20 },
  { itemID = 6049, label = "Fire Protection Potion", category = "Protection", stack = 20 },
  { itemID = 6050, label = "Frost Protection Potion", category = "Protection", stack = 20 },
  { itemID = 6051, label = "Holy Protection Potion", category = "Protection", stack = 20 },
  { itemID = 13461, label = "Greater Arcane Protection Potion", category = "Protection", stack = 20 },
  { itemID = 13458, label = "Greater Nature Protection Potion", category = "Protection", stack = 20 },
  { itemID = 13459, label = "Greater Shadow Protection Potion", category = "Protection", stack = 20 },
  { itemID = 13457, label = "Greater Fire Protection Potion", category = "Protection", stack = 20 },
  { itemID = 13456, label = "Greater Frost Protection Potion", category = "Protection", stack = 20 },
  { itemID = 13460, label = "Greater Holy Protection Potion", category = "Protection", stack = 20 },
  { itemID = 20079, label = "Spirit of Zanza", category = "Utility", stack = 20 },
  { itemID = 20080, label = "Sheen of Zanza", category = "Utility", stack = 20 },
  { itemID = 20081, label = "Swiftness of Zanza", category = "Utility", stack = 20 },
  { itemID = 3825, label = "Elixir of Fortitude", category = "Utility", stack = 20 },
  { itemID = 3826, label = "Mighty Troll's Blood Potion", category = "Utility", stack = 20 },
  { itemID = 20004, label = "Major Troll's Blood Potion", category = "Utility", stack = 20 },
  { itemID = 4623, label = "Lesser Stoneshield Potion", category = "Utility", stack = 20 },
  { itemID = 13455, label = "Greater Stoneshield Potion", category = "Utility", stack = 20 },
  { itemID = 13445, label = "Elixir of Superior Defense", category = "Utility", stack = 20 },
  { itemID = 8411, label = "Lung Juice Cocktail", category = "Utility", stack = 20 },
  { itemID = 20007, label = "Mageblood Potion", category = "Utility", stack = 20 },
  { itemID = 13510, label = "Flask of the Titans", category = "Utility", stack = 20 },
  { itemID = 13511, label = "Flask of Distilled Wisdom", category = "Utility", stack = 20 },
  { itemID = 13513, label = "Flask of Chromatic Resistance", category = "Utility", stack = 20 },
  { itemID = 9088, label = "Gift of Arthas", category = "Utility", stack = 20 },
  { itemID = 22682, label = "Frozen Rune", category = "Utility", stack = 20 },
  { itemID = 9036, label = "Magic Resistance Potion", category = "Utility", stack = 20 },
  { itemID = 9030, label = "Restorative Potion", category = "Utility", stack = 20 },
  { itemID = 9172, label = "Invisibility Potion", category = "Utility", stack = 20 },
  { itemID = 3823, label = "Lesser Invisibility Potion", category = "Utility", stack = 20 },
  { itemID = 5634, label = "Free Action Potion", category = "Utility", stack = 20 },
  { itemID = 20008, label = "Living Action Potion", category = "Utility", stack = 20 },
  { itemID = 2459, label = "Swiftness Potion", category = "Utility", stack = 20 },
  { itemID = 13447, label = "Elixir of the Sages", category = "Utility", stack = 20 },
  { itemID = 47412, label = "Concoction of the Arcane Giant", category = "Concoction", stack = 20 },
  { itemID = 47410, label = "Concoction of the Emerald Mongoose", category = "Concoction", stack = 20 },
  { itemID = 47414, label = "Concoction of the Dreamwater", category = "Concoction", stack = 20 },
  { itemID = 20748, label = "Brilliant Mana Oil", category = "Weapon", stack = 20 },
  { itemID = 20747, label = "Lesser Mana Oil", category = "Weapon", stack = 20 },
  { itemID = 23123, label = "Blessed Wizard Oil", category = "Weapon", stack = 20 },
  { itemID = 20749, label = "Brilliant Wizard Oil", category = "Weapon", stack = 20 },
  { itemID = 20750, label = "Wizard Oil", category = "Weapon", stack = 20 },
  { itemID = 3824, label = "Shadow Oil", category = "Weapon", stack = 20 },
  { itemID = 3829, label = "Frost Oil", category = "Weapon", stack = 20 },
  { itemID = 23122, label = "Consecrated Sharpening Stone", category = "Weapon", stack = 20 },
  { itemID = 12643, label = "Dense Weightstone", category = "Weapon", stack = 20 },
  { itemID = 12404, label = "Dense Sharpening Stone", category = "Weapon", stack = 20 },
  { itemID = 18262, label = "Elemental Sharpening Stone", category = "Weapon", stack = 20 },
  { itemID = 20844, label = "Deadly Poison", category = "Poisons", stack = 20 },
  { itemID = 8928, label = "Instant Poison", category = "Poisons", stack = 20 },
  { itemID = 9186, label = "Mind-numbing Poison", category = "Poisons", stack = 20 },
  { itemID = 10922, label = "Wound Poison", category = "Poisons", stack = 20 },
  { itemID = 3776, label = "Crippling Poison", category = "Poisons", stack = 20 },
  { itemID = 47409, label = "Corrosive Poison", category = "Poisons", stack = 20 },
  { itemID = 54010, label = "Dissolvent Poison", category = "Poisons", stack = 20 },
  { itemID = 13810, label = "Blessed Sunfruit", category = "Food/Drink", stack = 20 },
  { itemID = 13813, label = "Blessed Sunfruit Juice", category = "Food/Drink", stack = 20 },
  { itemID = 13931, label = "Nightfin Soup", category = "Food/Drink", stack = 20 },
  { itemID = 83309, label = "Empowering Herbal Salad", category = "Food/Drink", stack = 20 },
  { itemID = 21217, label = "Sagefish Delight", category = "Food/Drink", stack = 20 },
  { itemID = 51717, label = "Hardened Mushroom", category = "Food/Drink", stack = 20 },
  { itemID = 53015, label = "Gurubashi Gumbo", category = "Food/Drink", stack = 20 },
  { itemID = 51720, label = "Power Mushroom", category = "Food/Drink", stack = 20 },
  { itemID = 20452, label = "Smoked Desert Dumpling", category = "Food/Drink", stack = 20 },
  { itemID = 18045, label = "Tender Wolf Steak", category = "Food/Drink", stack = 20 },
  { itemID = 51712, label = "Juicy Watermelon", category = "Food/Drink", stack = 20 },
  { itemID = 84041, label = "Gilneas Hot Stew", category = "Food/Drink", stack = 20 },
  { itemID = 51711, label = "Sweet Mountain Berry", category = "Food/Drink", stack = 20 },
  { itemID = 60978, label = "Danonzo's Tel'Abim Medley", category = "Food/Drink", stack = 20 },
  { itemID = 60977, label = "Danonzo's Tel'Abim Delight", category = "Food/Drink", stack = 20 },
  { itemID = 60976, label = "Danonzo's Tel'Abim Surprise", category = "Food/Drink", stack = 20 },
  { itemID = 18254, label = "Runn Tum Tuber Surprise", category = "Food/Drink", stack = 20 },
  { itemID = 51718, label = "Sweet Watermelon", category = "Food/Drink", stack = 20 },
  { itemID = 13928, label = "Grilled Squid", category = "Food/Drink", stack = 20 },
  { itemID = 12217, label = "Dragonbreath Chili", category = "Food/Drink", stack = 20 },
  { itemID = 14530, label = "Heavy Runecloth Bandage", category = "Bandages", stack = 20 },
}

local DEFAULT_PROFILE_TEMPLATES = {
  {
    key = "HEALER",
    name = "HEALER",
    items = {
      { itemID = 20748, target = 2 },
      { itemID = 8423, target = 10 },
      { itemID = 60978, target = 20 },
      { itemID = 61224, target = 10 },
      { itemID = 3825, target = 10 },
      { itemID = 83309, target = 20 },
      { itemID = 13511, target = 5 },
      { itemID = 13461, target = 10 },
      { itemID = 13457, target = 10 },
      { itemID = 13456, target = 10 },
      { itemID = 13458, target = 10 },
      { itemID = 13459, target = 10 },
      { itemID = 20007, target = 10 },
      { itemID = 13931, target = 20 },
      { itemID = 9030, target = 10 },
      { itemID = 20079, target = 2 },
    },
  },
  {
    key = "SPDTANK",
    name = "SPDTANK",
    items = {
      { itemID = 20749, target = 10 },
      { itemID = 47412, target = 10 },
      { itemID = 47414, target = 10 },
      { itemID = 47410, target = 10 },
      { itemID = 60977, target = 20 },
      { itemID = 3825, target = 10 },
      { itemID = 13445, target = 10 },
      { itemID = 13512, target = 5 },
      { itemID = 13510, target = 5 },
      { itemID = 22682, target = 20 },
      { itemID = 13457, target = 10 },
      { itemID = 13456, target = 10 },
      { itemID = 13458, target = 10 },
      { itemID = 13459, target = 10 },
      { itemID = 13455, target = 10 },
      { itemID = 8412, target = 20 },
      { itemID = 51717, target = 20 },
      { itemID = 12450, target = 20 },
      { itemID = 20079, target = 5 },
    },
  },
  {
    key = "PHYSTANK",
    name = "PHYSTANK",
    items = {
      { itemID = 18262, target = 20 },
      { itemID = 3825, target = 10 },
      { itemID = 9206, target = 10 },
      { itemID = 13445, target = 10 },
      { itemID = 13452, target = 10 },
      { itemID = 13510, target = 5 },
      { itemID = 22682, target = 20 },
      { itemID = 13457, target = 10 },
      { itemID = 13456, target = 10 },
      { itemID = 13458, target = 10 },
      { itemID = 13459, target = 10 },
      { itemID = 13455, target = 10 },
      { itemID = 8412, target = 20 },
      { itemID = 51717, target = 20 },
      { itemID = 12450, target = 20 },
      { itemID = 51720, target = 20 },
      { itemID = 20079, target = 5 },
      { itemID = 12820, target = 20 },
    },
  },
}

local function tcount(tbl)
  local n = 0
  local k
  for k in pairs(tbl) do
    n = n + 1
  end
  return n
end

local function copyArrayOfTables(source)
  local out = {}
  local i
  for i = 1, table.getn(source) do
    out[i] = { itemID = source[i].itemID, target = source[i].target }
  end
  return out
end

local function clampNumber(value, low, high)
  if value < low then
    return low
  end
  if value > high then
    return high
  end
  return value
end

local function parseItemIDFromLink(link)
  if not link then
    return nil
  end
  local _, _, itemID = string.find(link, "item:(%d+):")
  if itemID then
    return tonumber(itemID)
  end
  return nil
end

local function sortByCategoryAndName(a, b)
  if a.category ~= b.category then
    return a.category < b.category
  end
  return a.label < b.label
end

table.sort(MASTER_ITEMS, sortByCategoryAndName)

function CK:Print(msg)
  DEFAULT_CHAT_FRAME:AddMessage("|cff6bd1ffChemKeeper|r: " .. msg)
end

function CK:FindProfileByTemplateKey(templateKey)
  local i
  for i = 1, table.getn(ChemKeeperDB.profiles or {}) do
    if ChemKeeperDB.profiles[i].templateKey == templateKey then
      return ChemKeeperDB.profiles[i], i
    end
  end
  return nil, nil
end

function CK:CreateProfileFromTemplate(template, shouldSelect)
  if not template then
    return nil
  end

  local profile = {
    id = ChemKeeperDB.nextProfileId,
    name = template.name,
    templateKey = template.key,
    items = copyArrayOfTables(template.items or {}),
  }

  ChemKeeperDB.nextProfileId = ChemKeeperDB.nextProfileId + 1
  table.insert(ChemKeeperDB.profiles, profile)

  local i
  for i = 1, table.getn(profile.items) do
    self:PrimeItemMeta(profile.items[i].itemID)
  end

  if shouldSelect then
    ChemKeeperDB.selectedProfileId = profile.id
  end

  return profile
end

function CK:EnsureDefaultProfiles()
  if not ChemKeeperDB.seededTemplates then
    ChemKeeperDB.seededTemplates = {}
  end

  local i
  for i = 1, table.getn(DEFAULT_PROFILE_TEMPLATES) do
    local template = DEFAULT_PROFILE_TEMPLATES[i]
    if not ChemKeeperDB.seededTemplates[template.key] then
      local existing = self:FindProfileByTemplateKey(template.key)
      if not existing then
        self:CreateProfileFromTemplate(template, nil)
      end
      ChemKeeperDB.seededTemplates[template.key] = 1
    end
  end
end

function CK:EnsureDB()
  if not ChemKeeperDB then
    ChemKeeperDB = {}
  end

  if not ChemKeeperDB.minimapAngle then
    ChemKeeperDB.minimapAngle = 210
  end

  if not ChemKeeperDB.window then
    ChemKeeperDB.window = {
      point = "CENTER",
      relativePoint = "CENTER",
      x = 0,
      y = 0,
      width = MIN_FRAME_WIDTH,
      height = MIN_FRAME_HEIGHT,
    }
  end

  ChemKeeperDB.window.width = math.max(tonumber(ChemKeeperDB.window.width) or MIN_FRAME_WIDTH, MIN_FRAME_WIDTH)
  ChemKeeperDB.window.height = math.max(tonumber(ChemKeeperDB.window.height) or MIN_FRAME_HEIGHT, MIN_FRAME_HEIGHT)

    if not ChemKeeperDB.itemMeta then
      ChemKeeperDB.itemMeta = {}
    end

    if not ChemKeeperDB.seededTemplates then
      ChemKeeperDB.seededTemplates = {}
    end

    if not ChemKeeperDB.profiles then
      ChemKeeperDB.profiles = {}
  end
  if not ChemKeeperDB.nextProfileId then
    ChemKeeperDB.nextProfileId = 1
  end
  if not ChemKeeperDB.selectedProfileId then
    ChemKeeperDB.selectedProfileId = 1
  end

  local normalizedMeta = {}
  local key, meta
  for key, meta in pairs(ChemKeeperDB.itemMeta) do
    local itemID = tonumber(key)
    if itemID then
      normalizedMeta[itemID] = {
        label = meta.label,
        texture = meta.texture,
        stack = tonumber(meta.stack),
      }
    end
  end
  ChemKeeperDB.itemMeta = normalizedMeta

  local function normalizeItems(sourceItems)
    local normalizedItems = {}
    local i
    for i = 1, table.getn(sourceItems or {}) do
      local entry = sourceItems[i]
      local itemID = tonumber(entry.itemID)
      local target = tonumber(entry.target) or 0
      if itemID then
        table.insert(normalizedItems, {
          itemID = itemID,
          target = clampNumber(target, 0, 999),
        })
      end
    end
    return normalizedItems
  end

    if table.getn(ChemKeeperDB.profiles) == 0 then
      local migratedItems = normalizeItems(ChemKeeperDB.activeItems or {})

      ChemKeeperDB.profiles[1] = {
        id = 1,
        name = "Profile1",
        items = {},
      }
      ChemKeeperDB.selectedProfileId = 1
      ChemKeeperDB.nextProfileId = 2

      if table.getn(migratedItems) > 0 then
        ChemKeeperDB.profiles[2] = {
          id = 2,
          name = "Custom",
          items = migratedItems,
        }
        ChemKeeperDB.nextProfileId = 3
      end
    else
    local normalizedProfiles = {}
    local maxId = 0
    local i
    for i = 1, table.getn(ChemKeeperDB.profiles) do
      local profile = ChemKeeperDB.profiles[i]
      local id = tonumber(profile.id) or i
      if id > maxId then
        maxId = id
      end
        table.insert(normalizedProfiles, {
          id = id,
          name = profile.name or ("Profile " .. id),
          templateKey = profile.templateKey,
          items = normalizeItems(profile.items),
        })
      end
    ChemKeeperDB.profiles = normalizedProfiles
    if ChemKeeperDB.nextProfileId <= maxId then
      ChemKeeperDB.nextProfileId = maxId + 1
    end
  end

  ChemKeeperDB.activeItems = nil
  self:EnsureDefaultProfiles()

  if not self:GetProfileById(ChemKeeperDB.selectedProfileId) then
    ChemKeeperDB.selectedProfileId = ChemKeeperDB.profiles[1].id
  end
end

function CK:GetItemLabel(itemID)
  itemID = tonumber(itemID)
  local meta = ChemKeeperDB.itemMeta and ChemKeeperDB.itemMeta[itemID]
  local name = GetItemInfo(itemID)
  if name then
    if meta then
      meta.label = name
    end
    return name
  end
  if meta and meta.label then
    return meta.label
  end
  return "Item " .. itemID
end

function CK:GetItemTexture(itemID)
  itemID = tonumber(itemID)
  local _, _, _, _, _, _, _, _, texture = GetItemInfo(itemID)
  if texture then
    if ChemKeeperDB.itemMeta[itemID] then
      ChemKeeperDB.itemMeta[itemID].texture = texture
    end
    return texture
  end
  if ChemKeeperDB.itemMeta[itemID] and ChemKeeperDB.itemMeta[itemID].texture then
    return ChemKeeperDB.itemMeta[itemID].texture
  end
  return ICON_PATH
end

function CK:GetItemStackSize(itemID)
  itemID = tonumber(itemID)
  local _, _, _, _, _, _, _, stackSize = GetItemInfo(itemID)
  stackSize = tonumber(stackSize)
  if stackSize and stackSize > 0 then
    if ChemKeeperDB.itemMeta[itemID] then
      ChemKeeperDB.itemMeta[itemID].stack = stackSize
    end
    return stackSize
  end
  if ChemKeeperDB.itemMeta[itemID] and tonumber(ChemKeeperDB.itemMeta[itemID].stack) then
    return tonumber(ChemKeeperDB.itemMeta[itemID].stack)
  end
  return 20
end

function CK:GetLogicalItemCount(itemID, containerCount)
  local count = tonumber(containerCount) or 1
  local stackSize = self:GetItemStackSize(itemID)

  if stackSize <= 1 then
    return 1
  end

  if count < 1 then
    return 1
  end

  return count
end

function CK:GetProfileById(profileId)
  profileId = tonumber(profileId)
  local i
  for i = 1, table.getn(ChemKeeperDB.profiles or {}) do
    if tonumber(ChemKeeperDB.profiles[i].id) == profileId then
      return ChemKeeperDB.profiles[i], i
    end
  end
  return nil, nil
end

function CK:GetCurrentProfile()
  local profile = self:GetProfileById(ChemKeeperDB.selectedProfileId)
  if profile then
    return profile
  end
  return ChemKeeperDB.profiles and ChemKeeperDB.profiles[1] or nil
end

function CK:GetActiveItemsTable()
  local profile = self:GetCurrentProfile()
  if not profile.items then
    profile.items = {}
  end
  return profile.items
end

function CK:GetSuggestedProfileName()
  local nextNumber = 1
  local used = {}
  local i

  for i = 1, table.getn(ChemKeeperDB.profiles or {}) do
    local name = ChemKeeperDB.profiles[i].name or ""
    local _, _, num = string.find(name, "^Profile(%d+)$")
    if num then
      used[tonumber(num)] = 1
    end
  end

  while used[nextNumber] do
    nextNumber = nextNumber + 1
  end

  return "Profile" .. nextNumber
end

function CK:SelectProfile(profileId)
  local profile = self:GetProfileById(profileId)
  if not profile then
    return
  end

  ChemKeeperDB.selectedProfileId = profile.id
  self:ScanInventories()
  self:RefreshAll()
end

function CK:CycleProfile(step)
  local _, currentIndex = self:GetProfileById(ChemKeeperDB.selectedProfileId)
  if not currentIndex then
    currentIndex = 1
  end

  local total = table.getn(ChemKeeperDB.profiles)
  if total == 0 then
    return
  end

  currentIndex = currentIndex + step
  if currentIndex < 1 then
    currentIndex = total
  elseif currentIndex > total then
    currentIndex = 1
  end

  self:SelectProfile(ChemKeeperDB.profiles[currentIndex].id)
end

function CK:CreateProfile(name)
  local profile = {
    id = ChemKeeperDB.nextProfileId,
    name = name or self:GetSuggestedProfileName(),
    items = {},
  }
  ChemKeeperDB.nextProfileId = ChemKeeperDB.nextProfileId + 1
  table.insert(ChemKeeperDB.profiles, profile)
  ChemKeeperDB.selectedProfileId = profile.id
  self:RefreshAll()
end

function CK:RenameCurrentProfile(name)
  name = string.gsub(name or "", "^%s+", "")
  name = string.gsub(name, "%s+$", "")
  if name == "" then
    return
  end

  local profile = self:GetCurrentProfile()
  if not profile then
    return
  end

  profile.name = name
  self:RefreshProfileControls()
end

function CK:DeleteCurrentProfile()
  if table.getn(ChemKeeperDB.profiles) <= 1 then
    self:Print("You cannot delete the last profile.")
    return
  end

  local profile, index = self:GetProfileById(ChemKeeperDB.selectedProfileId)
  if not profile then
    return
  end

  table.remove(ChemKeeperDB.profiles, index)
  if ChemKeeperDB.profiles[index] then
    ChemKeeperDB.selectedProfileId = ChemKeeperDB.profiles[index].id
  else
    ChemKeeperDB.selectedProfileId = ChemKeeperDB.profiles[index - 1].id
  end
  self:RefreshAll()
end

function CK:ConfirmDeleteCurrentProfile()
  local profile = self:GetCurrentProfile()
  if not profile then
    return
  end

  StaticPopup_Show("CHEMKEEPER_DELETE_PROFILE", profile.name or "this profile")
end

function CK:IsItemActive(itemID)
  itemID = tonumber(itemID)
  local items = self:GetActiveItemsTable()
  local i
  for i = 1, table.getn(items) do
    if tonumber(items[i].itemID) == itemID then
      return true, i
    end
  end
  return nil, nil
end

function CK:GetActiveItemsSorted()
  local list = {}
  local items = self:GetActiveItemsTable()
  local i
  for i = 1, table.getn(items) do
    list[i] = {
      itemID = tonumber(items[i].itemID),
      target = tonumber(items[i].target) or 0,
    }
  end

  table.sort(list, function(a, b)
    return self:GetItemLabel(a.itemID) < self:GetItemLabel(b.itemID)
  end)

  return list
end

function CK:GetCatalogItems()
  local list = {}
  local filterText = ""
  if self.mainFrame and self.mainFrame.editPanel and self.mainFrame.editPanel.catalogFilterBox then
    filterText = string.lower(self.mainFrame.editPanel.catalogFilterBox:GetText() or "")
  end
  local i
  for i = 1, table.getn(MASTER_ITEMS) do
    local entry = MASTER_ITEMS[i]
    if not self:IsItemActive(entry.itemID) then
      if filterText == "" then
        list[table.getn(list) + 1] = entry
      else
        local haystack = string.lower((entry.label or "") .. " " .. (entry.category or ""))
        if string.find(haystack, filterText, 1, true) then
          list[table.getn(list) + 1] = entry
        end
      end
    end
  end
  return list
end

function CK:RememberItemMeta(itemID, label, texture, stack)
  itemID = tonumber(itemID)
  stack = tonumber(stack)
  if not itemID then
    return
  end

  if not ChemKeeperDB.itemMeta[itemID] then
    ChemKeeperDB.itemMeta[itemID] = {}
  end

  local meta = ChemKeeperDB.itemMeta[itemID]
  if label then
    meta.label = label
  end
  if texture then
    meta.texture = texture
  end
  if stack and stack > 0 then
    meta.stack = stack
  end
end

function CK:PrimeItemMeta(itemID)
  local name, _, _, _, _, _, _, stackSize, texture = GetItemInfo(itemID)
  self:RememberItemMeta(itemID, name, texture, stackSize)
end

function CK:ParseItemIDFromText(text)
  if not text then
    return nil
  end

  local itemID = tonumber(text)
  if itemID then
    return itemID
  end

  local _, _, linkID = string.find(text, "item:(%d+):")
  if linkID then
    return tonumber(linkID)
  end

  return nil
end

function CK:AddTrackedItem(itemID)
  if not itemID then
    return
  end

  self:PrimeItemMeta(itemID)
  self:AddActiveItem(itemID)
end

function CK:AddActiveItem(itemID)
  itemID = tonumber(itemID)
  if not itemID then
    return
  end
  if self:IsItemActive(itemID) then
    return
  end
  table.insert(self:GetActiveItemsTable(), { itemID = itemID, target = 0 })
  self:RefreshAll()
end

function CK:RemoveActiveItem(itemID)
  local found, index = self:IsItemActive(itemID)
  if not found then
    return
  end
  table.remove(self:GetActiveItemsTable(), index)
  self:RefreshAll()
end

function CK:SetTargetForItem(itemID, target)
  itemID = tonumber(itemID)
  local found, index = self:IsItemActive(itemID)
  if not found then
    return
  end
  self:GetActiveItemsTable()[index].target = clampNumber(target or 0, 0, 999)
  self:RefreshAll()
end

function CK:SaveFramePosition()
  if not self.mainFrame then
    return
  end

  local point, _, relativePoint, x, y = self.mainFrame:GetPoint()
  ChemKeeperDB.window.point = point
  ChemKeeperDB.window.relativePoint = relativePoint
  ChemKeeperDB.window.x = x
  ChemKeeperDB.window.y = y
end

function CK:SetView(view)
  self.view = view

  if view == "overview" then
    self.mainFrame.editPanel:Hide()
    self.mainFrame.overviewPanel:Show()
    self.mainFrame.editTab:Enable()
    self.mainFrame.overviewTab:Disable()
  else
    self.mainFrame.editPanel:Show()
    self.mainFrame.overviewPanel:Hide()
    self.mainFrame.editTab:Disable()
    self.mainFrame.overviewTab:Enable()
  end

  self:RefreshAll()
end

function CK:CreateSectionLabel(parent, text, x, y)
  local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
  label:SetTextColor(0.95, 0.82, 0.28)
  label:SetText(text)
  return label
end

function CK:CreatePanelBox(parent, left, top, right, bottom, bgR, bgG, bgB)
  local box = CreateFrame("Frame", nil, parent)
  box:SetPoint("TOPLEFT", parent, "TOPLEFT", left, top)
  box:SetPoint("BOTTOMRIGHT", parent, "TOPLEFT", right, bottom)
  box:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 14,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
  })
  box:SetBackdropColor(bgR or 0.11, bgG or 0.12, bgB or 0.14, 1)
  box:SetBackdropBorderColor(0.45, 0.38, 0.16, 0.95)

  local topLine = box:CreateTexture(nil, "ARTWORK")
  topLine:SetHeight(1)
  topLine:SetPoint("TOPLEFT", box, "TOPLEFT", 8, -26)
  topLine:SetPoint("TOPRIGHT", box, "TOPRIGHT", -8, -26)
  topLine:SetTexture(0.78, 0.67, 0.25, 0.55)

  return box
end

function CK:CreateInsetArea(parent, left, top, right, bottom, bgR, bgG, bgB)
  local area = CreateFrame("Frame", nil, parent)
  area:SetPoint("TOPLEFT", parent, "TOPLEFT", left, top)
  area:SetPoint("BOTTOMRIGHT", parent, "TOPLEFT", right, bottom)

  local bg = area:CreateTexture(nil, "BACKGROUND")
  bg:SetAllPoints(area)
  bg:SetTexture(bgR or 0.095, bgG or 0.105, bgB or 0.13, 1)
  area.bg = bg

  local borderTop = area:CreateTexture(nil, "BORDER")
  borderTop:SetPoint("TOPLEFT", area, "TOPLEFT", 0, 0)
  borderTop:SetPoint("TOPRIGHT", area, "TOPRIGHT", 0, 0)
  borderTop:SetHeight(1)
  borderTop:SetTexture(0.32, 0.34, 0.4, 0.75)

  local borderBottom = area:CreateTexture(nil, "BORDER")
  borderBottom:SetPoint("BOTTOMLEFT", area, "BOTTOMLEFT", 0, 0)
  borderBottom:SetPoint("BOTTOMRIGHT", area, "BOTTOMRIGHT", 0, 0)
  borderBottom:SetHeight(1)
  borderBottom:SetTexture(0.05, 0.06, 0.08, 0.9)

  local borderLeft = area:CreateTexture(nil, "BORDER")
  borderLeft:SetPoint("TOPLEFT", area, "TOPLEFT", 0, 0)
  borderLeft:SetPoint("BOTTOMLEFT", area, "BOTTOMLEFT", 0, 0)
  borderLeft:SetWidth(1)
  borderLeft:SetTexture(0.32, 0.34, 0.4, 0.75)

  local borderRight = area:CreateTexture(nil, "BORDER")
  borderRight:SetPoint("TOPRIGHT", area, "TOPRIGHT", 0, 0)
  borderRight:SetPoint("BOTTOMRIGHT", area, "BOTTOMRIGHT", 0, 0)
  borderRight:SetWidth(1)
  borderRight:SetTexture(0.05, 0.06, 0.08, 0.9)

  return area
end

function CK:StyleInputBox(box, width, height)
  box:SetWidth(width)
  box:SetHeight(height)
  box:SetAutoFocus(false)
  box:SetFontObject(GameFontHighlightSmall)
  box:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
  })
  box:SetBackdropColor(0.08, 0.09, 0.12, 1)
  box:SetBackdropBorderColor(0.42, 0.45, 0.5, 0.9)
  box:SetTextInsets(6, 6, 0, 0)
  box:SetTextColor(0.95, 0.96, 0.98)
  box:SetJustifyH("CENTER")
end

function CK:ShowItemTooltip(anchor, itemID)
  if not itemID then
    return
  end

  GameTooltip:SetOwner(anchor, "ANCHOR_RIGHT")
  local link = select(2, GetItemInfo(itemID))
  if link then
    GameTooltip:SetHyperlink(link)
  else
    GameTooltip:SetText(self:GetItemLabel(itemID))
    GameTooltip:AddLine("Item ID: " .. itemID, 0.6, 0.6, 0.6)
    GameTooltip:Show()
  end
end

function CK:CommitTargetBox(box)
  if not box.itemID then
    return
  end

  local value = tonumber(box:GetText()) or 0
  value = clampNumber(value, 0, 999)
  box:SetText(value)
  box:ClearFocus()
  self:SetTargetForItem(box.itemID, value)
end

function CK:HandleAddItemBox()
  local box = self.mainFrame.editPanel.addBox
  local text = box:GetText()
  local itemID = self:ParseItemIDFromText(text)
  local _, _, linkLabel = string.find(text or "", "%[([^%]]+)%]")

  if not itemID then
    self.mainFrame.editPanel.addStatus:SetText("|cffff8080Enter an item ID or shift-click an item link.|r")
    return
  end

  if linkLabel then
    self:RememberItemMeta(itemID, linkLabel, nil, nil)
  end
  self:AddTrackedItem(itemID)
  box:SetText("")
  self.mainFrame.editPanel.addStatus:SetText("|cff80ff80Added:|r " .. self:GetItemLabel(itemID))
end

function CK:TryInsertLink(linkText)
  local box = self.linkCaptureBox
  if not box or not box:IsShown() then
    return nil
  end

  if GetFocus and GetFocus() ~= box then
    return nil
  end

  box:SetText(linkText or "")
  box:SetFocus()
  box:HighlightText(0, 0)
  return 1
end

function CK:GetFocusedCustomAddBox()
  local box = self.linkCaptureBox
  if not box or not box:IsShown() then
    return nil
  end
  if GetFocus and GetFocus() ~= box then
    return nil
  end
  return box
end

function CK:TryInsertLinkFromBagButton(buttonFrame)
  if not IsShiftKeyDown() then
    return nil
  end

  local box = self:GetFocusedCustomAddBox()
  if not box then
    return nil
  end

  if not buttonFrame then
    buttonFrame = this
  end
  if not buttonFrame then
    return nil
  end

  local parent = buttonFrame:GetParent()
  if not parent or not parent.GetID or not buttonFrame.GetID then
    return nil
  end

  local bag = parent:GetID()
  local slot = buttonFrame:GetID()
  if not bag or not slot then
    return nil
  end

  local link = GetContainerItemLink(bag, slot)
  if not link then
    return nil
  end

  return self:TryInsertLink(link)
end

function CK:InstallLinkHook()
  if self.linkHookInstalled then
    return
  end

  self.linkHookInstalled = 1
  self.ChatEdit_InsertLink_Original = ChatEdit_InsertLink

  ChatEdit_InsertLink = function(linkText)
    if CK:TryInsertLink(linkText) then
      return 1
    end

    if CK.ChatEdit_InsertLink_Original then
      return CK.ChatEdit_InsertLink_Original(linkText)
    end

    return nil
  end

  if ContainerFrameItemButton_OnClick then
    self.ContainerFrameItemButton_OnClick_Original = ContainerFrameItemButton_OnClick
    ContainerFrameItemButton_OnClick = function(button, ignoreShift)
      if not ignoreShift and CK:TryInsertLinkFromBagButton(this) then
        return
      end
      return CK.ContainerFrameItemButton_OnClick_Original(button, ignoreShift)
    end
  end

  if ContainerFrameItemButton_OnModifiedClick then
    self.ContainerFrameItemButton_OnModifiedClick_Original = ContainerFrameItemButton_OnModifiedClick
    ContainerFrameItemButton_OnModifiedClick = function(button)
      if CK:TryInsertLinkFromBagButton(this) then
        return
      end
      return CK.ContainerFrameItemButton_OnModifiedClick_Original(button)
    end
  end
end

function CK:ToggleMainFrame()
  if self.mainFrame:IsShown() then
    self.mainFrame:Hide()
  else
    self.mainFrame:Show()
    self:ScanInventories()
    self:RefreshAll()
  end
end

function CK:HandleEscapeInput(box, refreshRows)
  if box then
    box:ClearFocus()
  end

  if refreshRows then
    self:RefreshActiveRows()
  end

  if self.mainFrame and self.mainFrame:IsShown() then
    self.mainFrame:Hide()
  end
end

function CK:CommitProfileName()
  if not self.mainFrame or not self.mainFrame.profileNameBox then
    return
  end
  self:RenameCurrentProfile(self.mainFrame.profileNameBox:GetText())
end

function CK:RefreshProfileControls()
  if not self.mainFrame or not self.mainFrame.profileNameBox then
    return
  end

  local profile = self:GetCurrentProfile()
  local _, profileIndex = self:GetProfileById(profile and profile.id)
  if not profile then
    return
  end

  self.mainFrame.profileNameBox:SetText(profile.name or "")
  self.mainFrame.profileStatus:SetText("Profile " .. (profileIndex or 1) .. " / " .. table.getn(ChemKeeperDB.profiles))
end

function CK:CreateMainFrame()
  local frame = CreateFrame("Frame", "ChemKeeperMainFrame", UIParent)
  frame:SetWidth(ChemKeeperDB.window.width)
  frame:SetHeight(ChemKeeperDB.window.height)
  frame:SetPoint(ChemKeeperDB.window.point, UIParent, ChemKeeperDB.window.relativePoint, ChemKeeperDB.window.x, ChemKeeperDB.window.y)
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", function()
    this:StartMoving()
  end)
  frame:SetScript("OnDragStop", function()
    this:StopMovingOrSizing()
    CK:SaveFramePosition()
  end)
  frame:SetFrameStrata("DIALOG")
  frame:Hide()
  frame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
  })
  frame:SetBackdropColor(0.08, 0.09, 0.11, 1)
  frame:SetBackdropBorderColor(0.56, 0.47, 0.18, 0.95)

  local headerBg = frame:CreateTexture(nil, "BACKGROUND")
  headerBg:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -6)
  headerBg:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)
  headerBg:SetHeight(86)
  headerBg:SetTexture(0.16, 0.18, 0.22, 1)
  frame.headerBg = headerBg

  local bodyBg = frame:CreateTexture(nil, "BACKGROUND")
  bodyBg:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -94)
  bodyBg:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -6, 6)
  bodyBg:SetTexture(0.12, 0.13, 0.16, 1)
  frame.bodyBg = bodyBg

  local accent = frame:CreateTexture(nil, "ARTWORK")
  accent:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -88)
  accent:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -10, -88)
  accent:SetHeight(2)
  accent:SetTexture(0.79, 0.68, 0.24, 0.9)
  frame.accent = accent

  local titleIcon = frame:CreateTexture(nil, "ARTWORK")
  titleIcon:SetWidth(22)
  titleIcon:SetHeight(22)
  titleIcon:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -16)
  titleIcon:SetTexture(ICON_PATH)
  frame.titleIcon = titleIcon

  local title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
  title:SetPoint("TOPLEFT", frame, "TOPLEFT", 46, -14)
  title:SetTextColor(0.98, 0.9, 0.36)
  title:SetText("ChemKeeper")

  local subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
  subtitle:SetTextColor(0.76, 0.8, 0.86)
  subtitle:SetText("Consumable planning, stock tracking, and bank refill")

  local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)
  frame.close = close

  local editTab = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
  editTab:SetWidth(120)
  editTab:SetHeight(24)
  editTab:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -186, -22)
  editTab:SetText("Edit List")
  editTab:SetScript("OnClick", function()
    CK:SetView("edit")
  end)
  frame.editTab = editTab

  local overviewTab = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
  overviewTab:SetWidth(120)
  overviewTab:SetHeight(24)
  overviewTab:SetPoint("LEFT", editTab, "RIGHT", 8, 0)
  overviewTab:SetText("Overview")
  overviewTab:SetScript("OnClick", function()
    CK:SetView("overview")
  end)
  frame.overviewTab = overviewTab

  local profileLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  profileLabel:SetPoint("TOPLEFT", frame, "TOPLEFT", 18, -60)
  profileLabel:SetTextColor(0.95, 0.82, 0.28)
  profileLabel:SetText("Profile")
  frame.profileLabel = profileLabel

  local prevProfile = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
  prevProfile:SetWidth(24)
  prevProfile:SetHeight(20)
  prevProfile:SetPoint("LEFT", profileLabel, "RIGHT", 8, 0)
  prevProfile:SetText("<")
  prevProfile:SetScript("OnClick", function()
    CK:CycleProfile(-1)
  end)
  frame.prevProfile = prevProfile

  local nextProfile = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
  nextProfile:SetWidth(24)
  nextProfile:SetHeight(20)
  nextProfile:SetPoint("LEFT", prevProfile, "RIGHT", 4, 0)
  nextProfile:SetText(">")
  nextProfile:SetScript("OnClick", function()
    CK:CycleProfile(1)
  end)
  frame.nextProfile = nextProfile

  local profileNameBox = CreateFrame("EditBox", nil, frame)
  self:StyleInputBox(profileNameBox, 160, 20)
  profileNameBox:SetPoint("LEFT", nextProfile, "RIGHT", 8, 0)
  profileNameBox:SetJustifyH("LEFT")
  profileNameBox:SetScript("OnEnterPressed", function()
    CK:CommitProfileName()
    this:ClearFocus()
  end)
  profileNameBox:SetScript("OnEditFocusLost", function()
    CK:CommitProfileName()
  end)
  profileNameBox:SetScript("OnEscapePressed", function()
    CK:HandleEscapeInput(this, nil)
  end)
  frame.profileNameBox = profileNameBox

  local newProfile = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
  newProfile:SetWidth(52)
  newProfile:SetHeight(20)
  newProfile:SetPoint("LEFT", profileNameBox, "RIGHT", 8, 0)
  newProfile:SetText("New")
  newProfile:SetScript("OnClick", function()
    CK:CreateProfile()
  end)
  frame.newProfile = newProfile

  local deleteProfile = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
  deleteProfile:SetWidth(60)
  deleteProfile:SetHeight(20)
  deleteProfile:SetPoint("LEFT", newProfile, "RIGHT", 6, 0)
  deleteProfile:SetText("Delete")
  deleteProfile:SetScript("OnClick", function()
    CK:ConfirmDeleteCurrentProfile()
  end)
  frame.deleteProfile = deleteProfile

  local profileStatus = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  profileStatus:SetPoint("LEFT", deleteProfile, "RIGHT", 10, 0)
  profileStatus:SetTextColor(0.76, 0.8, 0.86)
  profileStatus:SetText("")
  frame.profileStatus = profileStatus

  local editPanel = CreateFrame("Frame", nil, frame)
  editPanel:SetPoint("TOPLEFT", frame, "TOPLEFT", 14, -116)
  editPanel:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -14, 14)
  frame.editPanel = editPanel

  local overviewPanel = CreateFrame("Frame", nil, frame)
  overviewPanel:SetPoint("TOPLEFT", frame, "TOPLEFT", 14, -116)
  overviewPanel:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -14, 14)
  frame.overviewPanel = overviewPanel

  self.mainFrame = frame
  table.insert(UISpecialFrames, "ChemKeeperMainFrame")
  self:CreateEditPanel(editPanel)
  self:CreateOverviewPanel(overviewPanel)
  self:SetView("edit")
  self:RefreshProfileControls()
end

function CK:CreateEditPanel(panel)
  panel.activeBox = self:CreatePanelBox(panel, 0, 0, 392, -490, 0.12, 0.13, 0.16)
  panel.catalogBox = self:CreatePanelBox(panel, 408, 0, 832, -320, 0.11, 0.125, 0.15)
  panel.customBox = self:CreatePanelBox(panel, 408, -336, 832, -490, 0.11, 0.12, 0.145)

  self:CreateSectionLabel(panel.activeBox, "Tracked Consumables", 10, -8)

  local activeHint = panel.activeBox:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  activeHint:SetPoint("TOPLEFT", panel.activeBox, "TOPLEFT", 10, -30)
  activeHint:SetTextColor(0.76, 0.8, 0.86)
  activeHint:SetText("Set your desired amount for each consumable.")

  local activeRowsBox = self:CreateInsetArea(panel.activeBox, 8, -52, 380, -488, 0.095, 0.105, 0.13)
  panel.activeRowsBox = activeRowsBox

  local activeScroll = CreateFrame("ScrollFrame", "ChemKeeperActiveScroll", panel.activeRowsBox, "FauxScrollFrameTemplate")
  activeScroll:SetWidth(336)
  activeScroll:SetHeight(ACTIVE_VISIBLE_ROWS * ACTIVE_ROW_HEIGHT)
  activeScroll:SetPoint("TOPLEFT", panel.activeRowsBox, "TOPLEFT", 8, -8)
  activeScroll:SetScript("OnVerticalScroll", function()
    FauxScrollFrame_OnVerticalScroll(ACTIVE_ROW_HEIGHT, function()
      CK:RefreshActiveRows()
    end)
  end)
  panel.activeScroll = activeScroll

  local activeBar = getglobal("ChemKeeperActiveScrollScrollBar")
  if activeBar then
    activeBar:ClearAllPoints()
    activeBar:SetPoint("TOPRIGHT", panel.activeRowsBox, "TOPRIGHT", -8, -16)
    activeBar:SetPoint("BOTTOMRIGHT", panel.activeRowsBox, "BOTTOMRIGHT", -8, 16)
  end

  panel.activeRows = {}

  local i
  for i = 1, ACTIVE_VISIBLE_ROWS do
    local row = CreateFrame("Frame", nil, panel.activeRowsBox)
    row:SetWidth(334)
    row:SetHeight(20)
    row:SetPoint("TOPLEFT", panel.activeRowsBox, "TOPLEFT", 8, -10 - ((i - 1) * ACTIVE_ROW_HEIGHT))

    if math.mod(i, 2) == 0 then
      local bg = row:CreateTexture(nil, "BACKGROUND")
      bg:SetAllPoints(row)
      bg:SetTexture(0.17, 0.19, 0.23, 1)
    else
      local bg = row:CreateTexture(nil, "BACKGROUND")
      bg:SetAllPoints(row)
      bg:SetTexture(0.13, 0.14, 0.18, 1)
    end

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetWidth(16)
    icon:SetHeight(16)
    icon:SetPoint("LEFT", 2, 0)
    row.icon = icon

    local iconButton = CreateFrame("Button", nil, row)
    iconButton:SetAllPoints(icon)
    iconButton:SetScript("OnEnter", function()
      CK:ShowItemTooltip(this, this.itemID)
    end)
    iconButton:SetScript("OnLeave", function()
      GameTooltip:Hide()
    end)
    row.iconButton = iconButton

    local name = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    name:SetWidth(182)
    name:SetJustifyH("LEFT")
    name:SetPoint("LEFT", 26, 0)
    name:SetTextColor(0.92, 0.94, 0.98)
    row.name = name

    local target = CreateFrame("EditBox", nil, row)
    self:StyleInputBox(target, 48, 20)
    target:SetNumeric(true)
    target:SetMaxLetters(3)
    target:SetPoint("LEFT", 216, 0)
    target:SetScript("OnEnterPressed", function()
      CK:CommitTargetBox(this)
    end)
    target:SetScript("OnEscapePressed", function()
      CK:HandleEscapeInput(this, 1)
    end)
    target:SetScript("OnEditFocusLost", function()
      CK:CommitTargetBox(this)
    end)
    row.target = target

    local remove = CreateFrame("Button", nil, row, "GameMenuButtonTemplate")
    remove:SetWidth(52)
    remove:SetHeight(18)
    remove:SetPoint("LEFT", 274, 0)
    remove:SetText("Remove")
    remove:SetScript("OnClick", function()
      CK:RemoveActiveItem(this.itemID)
    end)
    row.remove = remove

    panel.activeRows[i] = row
  end

  self:CreateSectionLabel(panel.catalogBox, "Catalog", 10, -8)

  local catalogHint = panel.catalogBox:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  catalogHint:SetWidth(388)
  catalogHint:SetJustifyH("LEFT")
  catalogHint:SetPoint("TOPLEFT", panel.catalogBox, "TOPLEFT", 10, -30)
  catalogHint:SetTextColor(0.76, 0.8, 0.86)
  catalogHint:SetText("Preset consumables you can add to your tracked list.")

  local catalogFilterBox = CreateFrame("EditBox", nil, panel.catalogBox)
  self:StyleInputBox(catalogFilterBox, 220, 20)
  catalogFilterBox:SetPoint("TOPLEFT", panel.catalogBox, "TOPLEFT", 10, -52)
  catalogFilterBox:SetJustifyH("LEFT")
  catalogFilterBox:SetText("")
  catalogFilterBox:SetScript("OnTextChanged", function()
    CK:RefreshCatalogRows()
  end)
  catalogFilterBox:SetScript("OnEscapePressed", function()
    CK:HandleEscapeInput(this, nil)
  end)
  panel.catalogFilterBox = catalogFilterBox

  local catalogFilterLabel = panel.catalogBox:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  catalogFilterLabel:SetWidth(160)
  catalogFilterLabel:SetJustifyH("LEFT")
  catalogFilterLabel:SetJustifyV("MIDDLE")
  catalogFilterLabel:SetPoint("LEFT", catalogFilterBox, "RIGHT", 8, 0)
  catalogFilterLabel:SetTextColor(0.72, 0.76, 0.82)
  catalogFilterLabel:SetText("Filter by name or category")

  local catalogRowsBox = self:CreateInsetArea(panel.catalogBox, 8, -82, 412, -312, 0.095, 0.105, 0.13)
  panel.catalogRowsBox = catalogRowsBox

  local catalogScroll = CreateFrame("ScrollFrame", "ChemKeeperCatalogScroll", panel.catalogRowsBox, "FauxScrollFrameTemplate")
  catalogScroll:SetWidth(360)
  catalogScroll:SetHeight(216)
  catalogScroll:SetPoint("TOPLEFT", panel.catalogRowsBox, "TOPLEFT", 8, -8)
  catalogScroll:SetScript("OnVerticalScroll", function()
    FauxScrollFrame_OnVerticalScroll(CATALOG_ROW_HEIGHT, function()
      CK:RefreshCatalogRows()
    end)
  end)
  panel.catalogScroll = catalogScroll

  local catalogBar = getglobal("ChemKeeperCatalogScrollScrollBar")
  if catalogBar then
    catalogBar:ClearAllPoints()
    catalogBar:SetPoint("TOPRIGHT", panel.catalogRowsBox, "TOPRIGHT", -8, -16)
    catalogBar:SetPoint("BOTTOMRIGHT", panel.catalogRowsBox, "BOTTOMRIGHT", -8, 16)
  end

  panel.catalogRows = {}

  for i = 1, 7 do
    local row = CreateFrame("Frame", nil, panel.catalogRowsBox)
    row:SetWidth(342)
    row:SetHeight(CATALOG_ROW_HEIGHT)
    row:SetPoint("TOPLEFT", panel.catalogRowsBox, "TOPLEFT", 8, -10 - ((i - 1) * CATALOG_ROW_HEIGHT))

    if math.mod(i, 2) == 0 then
      local bg = row:CreateTexture(nil, "BACKGROUND")
      bg:SetAllPoints(row)
      bg:SetTexture(0.17, 0.19, 0.23, 1)
    else
      local bg = row:CreateTexture(nil, "BACKGROUND")
      bg:SetAllPoints(row)
      bg:SetTexture(0.13, 0.14, 0.18, 1)
    end

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetWidth(16)
    icon:SetHeight(16)
    icon:SetPoint("LEFT", 2, 0)
    row.icon = icon

    local iconButton = CreateFrame("Button", nil, row)
    iconButton:SetAllPoints(icon)
    iconButton:SetScript("OnEnter", function()
      CK:ShowItemTooltip(this, this.itemID)
    end)
    iconButton:SetScript("OnLeave", function()
      GameTooltip:Hide()
    end)
    row.iconButton = iconButton

    local name = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    name:SetWidth(168)
    name:SetHeight(CATALOG_ROW_HEIGHT - 4)
    name:SetJustifyH("LEFT")
    name:SetJustifyV("MIDDLE")
    name:SetPoint("LEFT", 26, 0)
    name:SetTextColor(0.92, 0.94, 0.98)
    row.name = name

    local category = row:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    category:SetWidth(64)
    category:SetHeight(CATALOG_ROW_HEIGHT - 4)
    category:SetJustifyH("LEFT")
    category:SetJustifyV("MIDDLE")
    category:SetPoint("LEFT", 196, 0)
    category:SetTextColor(0.72, 0.76, 0.82)
    row.category = category

    local add = CreateFrame("Button", nil, row, "GameMenuButtonTemplate")
    add:SetWidth(48)
    add:SetHeight(20)
    add:SetPoint("LEFT", 278, 0)
    add:SetText("Add")
    add:SetScript("OnClick", function()
      CK:AddTrackedItem(this.itemID)
    end)
    row.add = add

    panel.catalogRows[i] = row
  end

  self:CreateSectionLabel(panel.customBox, "Add Custom Item", 10, -8)

  local addHint = panel.customBox:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  addHint:SetWidth(388)
  addHint:SetJustifyH("LEFT")
  addHint:SetPoint("TOPLEFT", panel.customBox, "TOPLEFT", 10, -30)
  addHint:SetTextColor(0.76, 0.8, 0.86)
  addHint:SetText("Shift-click an item link or type an item ID.")

  local addBox = CreateFrame("EditBox", "ChemKeeperAddItemBox", panel.customBox)
  self:StyleInputBox(addBox, 260, 20)
  addBox:SetPoint("TOPLEFT", panel.customBox, "TOPLEFT", 10, -62)
  addBox:SetScript("OnEditFocusGained", function()
    CK.linkCaptureBox = this
  end)
  addBox:SetScript("OnEditFocusLost", function()
    if CK.linkCaptureBox == this then
      CK.linkCaptureBox = nil
    end
  end)
  addBox:SetScript("OnEnterPressed", function()
    CK:HandleAddItemBox()
  end)
  addBox:SetScript("OnEscapePressed", function()
    CK:HandleEscapeInput(this, nil)
  end)
  panel.addBox = addBox

  local addButton = CreateFrame("Button", nil, panel.customBox, "GameMenuButtonTemplate")
  addButton:SetWidth(80)
  addButton:SetHeight(22)
  addButton:SetPoint("LEFT", addBox, "RIGHT", 8, 0)
  addButton:SetText("Add Item")
  addButton:SetScript("OnClick", function()
    CK:HandleAddItemBox()
  end)
  panel.addButton = addButton

  local addStatus = panel.customBox:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  addStatus:SetWidth(388)
  addStatus:SetJustifyH("LEFT")
  addStatus:SetPoint("TOPLEFT", addBox, "BOTTOMLEFT", 0, -10)
  addStatus:SetTextColor(0.85, 0.88, 0.92)
  addStatus:SetText("Use presets above or add any custom item manually.")
  panel.addStatus = addStatus

  local note = panel.customBox:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  note:SetWidth(388)
  note:SetJustifyH("LEFT")
  note:SetPoint("TOPLEFT", addStatus, "BOTTOMLEFT", 0, -8)
  note:SetTextColor(0.68, 0.72, 0.78)
  note:SetText("Tip: add from bags/bank first to cache names and icons.")
end

function CK:CreateOverviewPanel(panel)
  panel.listBox = self:CreatePanelBox(panel, 0, 0, 832, -490, 0.11, 0.125, 0.15)
  self:CreateSectionLabel(panel.listBox, "Stock Overview", 10, -8)

  local hint = panel.listBox:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  hint:SetPoint("TOPLEFT", panel.listBox, "TOPLEFT", 10, -30)
  hint:SetTextColor(0.76, 0.8, 0.86)
  hint:SetText("Compare your target amount against your bags and bank.")

  local bankStatus = panel.listBox:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  bankStatus:SetPoint("TOPRIGHT", panel.listBox, "TOPRIGHT", -10, -10)
  bankStatus:SetText("")
  panel.bankStatus = bankStatus

  local headers = {
    { text = "Item", x = 34 },
    { text = "Target", x = 420 },
    { text = "Bags", x = 510 },
    { text = "Bank", x = 585 },
    { text = "Missing", x = 660 },
  }

  local i
  for i = 1, table.getn(headers) do
    local fs = panel.listBox:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    fs:SetPoint("TOPLEFT", panel.listBox, "TOPLEFT", headers[i].x, -54)
    fs:SetTextColor(0.95, 0.82, 0.28)
    fs:SetText(headers[i].text)
  end

  local refreshButton = CreateFrame("Button", nil, panel.listBox, "GameMenuButtonTemplate")
  refreshButton:SetWidth(90)
  refreshButton:SetHeight(22)
  refreshButton:SetPoint("BOTTOMRIGHT", panel.listBox, "BOTTOMRIGHT", -118, 10)
  refreshButton:SetText("Refresh")
  refreshButton:SetScript("OnClick", function()
    CK:ScanInventories()
    CK:RefreshAll()
  end)
  panel.refreshButton = refreshButton

  local withdrawButton = CreateFrame("Button", nil, panel.listBox, "GameMenuButtonTemplate")
  withdrawButton:SetWidth(110)
  withdrawButton:SetHeight(22)
  withdrawButton:SetPoint("BOTTOMRIGHT", panel.listBox, "BOTTOMRIGHT", -10, 10)
  withdrawButton:SetText("Withdraw Missing")
  withdrawButton:SetScript("OnClick", function()
    CK:StartWithdraw()
  end)
  panel.withdrawButton = withdrawButton

  local rowsBox = self:CreateInsetArea(panel.listBox, 8, -66, 822, -454, 0.095, 0.105, 0.13)
  panel.rowsBox = rowsBox

  local scroll = CreateFrame("ScrollFrame", "ChemKeeperOverviewScroll", panel.rowsBox, "FauxScrollFrameTemplate")
  scroll:SetWidth(786)
  scroll:SetHeight(OVERVIEW_VISIBLE_ROWS * OVERVIEW_ROW_HEIGHT)
  scroll:SetPoint("TOPLEFT", panel.rowsBox, "TOPLEFT", 8, -8)
  scroll:SetScript("OnVerticalScroll", function()
    FauxScrollFrame_OnVerticalScroll(OVERVIEW_ROW_HEIGHT, function()
      CK:RefreshOverviewRows()
    end)
  end)
  panel.scroll = scroll

  local overviewBar = getglobal("ChemKeeperOverviewScrollScrollBar")
  if overviewBar then
    overviewBar:ClearAllPoints()
    overviewBar:SetPoint("TOPRIGHT", panel.rowsBox, "TOPRIGHT", -8, -16)
    overviewBar:SetPoint("BOTTOMRIGHT", panel.rowsBox, "BOTTOMRIGHT", -8, 16)
  end

  panel.rows = {}

  for i = 1, OVERVIEW_VISIBLE_ROWS do
    local row = CreateFrame("Frame", nil, panel.rowsBox)
    row:SetWidth(768)
    row:SetHeight(OVERVIEW_ROW_HEIGHT)
    row:SetPoint("TOPLEFT", panel.rowsBox, "TOPLEFT", 8, -10 - ((i - 1) * OVERVIEW_ROW_HEIGHT))

    if math.mod(i, 2) == 0 then
      local bg = row:CreateTexture(nil, "BACKGROUND")
      bg:SetAllPoints(row)
      bg:SetTexture(0.17, 0.19, 0.23, 1)
    else
      local bg = row:CreateTexture(nil, "BACKGROUND")
      bg:SetAllPoints(row)
      bg:SetTexture(0.13, 0.14, 0.18, 1)
    end

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetWidth(16)
    icon:SetHeight(16)
    icon:SetPoint("LEFT", 2, 0)
    row.icon = icon

    local iconButton = CreateFrame("Button", nil, row)
    iconButton:SetAllPoints(icon)
    iconButton:SetScript("OnEnter", function()
      CK:ShowItemTooltip(this, this.itemID)
    end)
    iconButton:SetScript("OnLeave", function()
      GameTooltip:Hide()
    end)
    row.iconButton = iconButton

    local name = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    name:SetWidth(360)
    name:SetJustifyH("LEFT")
    name:SetPoint("LEFT", 26, 0)
    name:SetTextColor(0.92, 0.94, 0.98)
    row.name = name

    local target = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    target:SetWidth(55)
    target:SetJustifyH("LEFT")
    target:SetPoint("LEFT", 420, 0)
    row.target = target

    local bags = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    bags:SetWidth(45)
    bags:SetJustifyH("LEFT")
    bags:SetPoint("LEFT", 510, 0)
    row.bags = bags

    local bank = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    bank:SetWidth(45)
    bank:SetJustifyH("LEFT")
    bank:SetPoint("LEFT", 585, 0)
    row.bank = bank

    local missing = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    missing:SetWidth(60)
    missing:SetJustifyH("LEFT")
    missing:SetPoint("LEFT", 660, 0)
    row.missing = missing

    panel.rows[i] = row
  end
end

function CK:CreateMinimapButton()
  local radius = 78
  local angle = ChemKeeperDB.minimapAngle or 210

  local btn = CreateFrame("Button", "ChemKeeperMinimapButton", Minimap)
  btn:SetWidth(33)
  btn:SetHeight(33)
  btn:SetFrameStrata("MEDIUM")
  btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  btn:RegisterForDrag("LeftButton")

  local icon = btn:CreateTexture(nil, "OVERLAY")
  icon:SetTexture(ICON_PATH)
  icon:SetWidth(20)
  icon:SetHeight(20)
  icon:SetPoint("CENTER", 0, 0)

  local highlight = btn:CreateTexture(nil, "HIGHLIGHT")
  highlight:SetTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
  highlight:SetAllPoints(btn)
  highlight:SetBlendMode("ADD")

  local border = btn:CreateTexture(nil, "BACKGROUND")
  border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
  border:SetWidth(56)
  border:SetHeight(56)
  border:SetPoint("TOPLEFT", btn, "TOPLEFT", 0, 0)

  local function updatePosition()
    btn:SetPoint("CENTER", Minimap, "CENTER", radius * math.cos(math.rad(angle)), radius * math.sin(math.rad(angle)))
  end

  updatePosition()

  btn:SetScript("OnDragStart", function()
    this:SetScript("OnUpdate", function()
      local mx, my = Minimap:GetCenter()
      local cx, cy = GetCursorPosition()
      local scale = UIParent:GetScale()
      cx = cx / scale
      cy = cy / scale
      angle = math.deg(math.atan2(cy - my, cx - mx))
      ChemKeeperDB.minimapAngle = angle
      updatePosition()
    end)
  end)

  btn:SetScript("OnDragStop", function()
    this:SetScript("OnUpdate", nil)
  end)

  btn:SetScript("OnClick", function()
    if arg1 == "RightButton" then
      if not CK.mainFrame:IsShown() then
        CK.mainFrame:Show()
      end
      if CK.view == "overview" then
        CK:SetView("edit")
      else
        CK:SetView("overview")
      end
      CK:ScanInventories()
      CK:RefreshAll()
    else
      CK:ToggleMainFrame()
    end
  end)

  btn:SetScript("OnEnter", function()
    GameTooltip:SetOwner(this, "ANCHOR_LEFT")
    GameTooltip:SetText("ChemKeeper")
    GameTooltip:AddLine("Left-click: toggle window", 1, 1, 1)
    GameTooltip:AddLine("Right-click: switch tab", 1, 1, 1)
    GameTooltip:AddLine("Drag: move minimap button", 1, 1, 1)
    GameTooltip:Show()
  end)

  btn:SetScript("OnLeave", function()
    GameTooltip:Hide()
  end)

  self.minimapButton = btn
end

function CK:BuildCountsForBagRange(startBag, endBag)
  local counts = {}
  local slots = {}
  local empties = {}
  local bag

  for bag = startBag, endBag do
    local numSlots = GetContainerNumSlots(bag)
    if numSlots and numSlots > 0 then
      local slot
        for slot = 1, numSlots do
          local link = GetContainerItemLink(bag, slot)
          if link then
            local itemID = parseItemIDFromLink(link)
            local texture, count, locked = GetContainerItemInfo(bag, slot)
            count = count or 1

            if itemID then
              local logicalCount = self:GetLogicalItemCount(itemID, count)
              self:RememberItemMeta(itemID, GetItemInfo(itemID), texture, self:GetItemStackSize(itemID))
              counts[itemID] = (counts[itemID] or 0) + logicalCount
              if not slots[itemID] then
                slots[itemID] = {}
              end
              table.insert(slots[itemID], {
                bag = bag,
                slot = slot,
                count = logicalCount,
                rawCount = count,
                locked = locked,
              })
            end
          else
            table.insert(empties, { bag = bag, slot = slot })
          end
      end
    end
  end

  return counts, slots, empties
end

function CK:ScanBankInventory()
  local counts = {}
  local slots = {}
  local empties = {}

  local function merge(countMap, slotMap, emptyList)
    local itemID
    for itemID, amount in pairs(countMap) do
      counts[itemID] = (counts[itemID] or 0) + amount
    end
    for itemID, list in pairs(slotMap) do
      if not slots[itemID] then
        slots[itemID] = {}
      end
      local i
      for i = 1, table.getn(list) do
        table.insert(slots[itemID], list[i])
      end
    end
    local i
    for i = 1, table.getn(emptyList) do
      table.insert(empties, emptyList[i])
    end
  end

  local mainCounts, mainSlots, mainEmpties = self:BuildCountsForBagRange(-1, -1)
  merge(mainCounts, mainSlots, mainEmpties)

  local bagCounts, bagSlots, bagEmpties = self:BuildCountsForBagRange(5, 11)
  merge(bagCounts, bagSlots, bagEmpties)

  return counts, slots, empties
end

function CK:ScanInventories()
  self.playerCounts, self.playerSlots, self.playerEmptySlots = self:BuildCountsForBagRange(0, 4)

  if self.bankOpen then
    self.bankCounts, self.bankSlots, self.bankEmptySlots = self:ScanBankInventory()
    self.bankCache = self.bankCounts
  elseif not self.bankCache then
    self.bankCache = {}
  end
end

function CK:GetBankCount(itemID)
  if self.bankOpen and self.bankCounts then
    return self.bankCounts[itemID] or 0
  end
  if self.bankCache then
    return self.bankCache[itemID] or 0
  end
  return 0
end

function CK:RefreshActiveRows()
  local list = self:GetActiveItemsSorted()
  local offset = FauxScrollFrame_GetOffset(self.mainFrame.editPanel.activeScroll)
  FauxScrollFrame_Update(
    self.mainFrame.editPanel.activeScroll,
    table.getn(list),
    table.getn(self.mainFrame.editPanel.activeRows),
    ACTIVE_ROW_HEIGHT
  )

  local i
  for i = 1, table.getn(self.mainFrame.editPanel.activeRows) do
    local row = self.mainFrame.editPanel.activeRows[i]
    local entry = list[i + offset]
    if entry then
      row:Show()
      row.icon:SetTexture(self:GetItemTexture(entry.itemID))
      row.iconButton.itemID = entry.itemID
      row.name:SetText(self:GetItemLabel(entry.itemID))
      row.target.itemID = entry.itemID
      row.target:SetText(entry.target or 0)
      row.remove.itemID = entry.itemID
    else
      row:Hide()
    end
  end
end

function CK:RefreshCatalogRows()
  local list = self:GetCatalogItems()
  local offset = FauxScrollFrame_GetOffset(self.mainFrame.editPanel.catalogScroll)
  FauxScrollFrame_Update(
    self.mainFrame.editPanel.catalogScroll,
    table.getn(list),
    table.getn(self.mainFrame.editPanel.catalogRows),
    CATALOG_ROW_HEIGHT
  )

  local i
  for i = 1, table.getn(self.mainFrame.editPanel.catalogRows) do
    local row = self.mainFrame.editPanel.catalogRows[i]
    local entry = list[i + offset]
    if entry then
      self:RememberItemMeta(entry.itemID, entry.label, nil, entry.stack)
      row:Show()
      row.icon:SetTexture(self:GetItemTexture(entry.itemID))
      row.iconButton.itemID = entry.itemID
      row.name:SetText(self:GetItemLabel(entry.itemID))
      row.category:SetText(entry.category)
      row.add.itemID = entry.itemID
    else
      row:Hide()
    end
  end
end

function CK:RefreshOverviewRows()
  local list = self:GetActiveItemsSorted()
  local offset = FauxScrollFrame_GetOffset(self.mainFrame.overviewPanel.scroll)
  FauxScrollFrame_Update(
    self.mainFrame.overviewPanel.scroll,
    table.getn(list),
    table.getn(self.mainFrame.overviewPanel.rows),
    OVERVIEW_ROW_HEIGHT
  )

  local i
  for i = 1, table.getn(self.mainFrame.overviewPanel.rows) do
    local row = self.mainFrame.overviewPanel.rows[i]
    local entry = list[i + offset]
    if entry then
      local bagCount = (self.playerCounts and self.playerCounts[entry.itemID]) or 0
      local bankCount = self:GetBankCount(entry.itemID)
      local missing = entry.target - bagCount
      if missing < 0 then
        missing = 0
      end

      row:Show()
      row.icon:SetTexture(self:GetItemTexture(entry.itemID))
      row.iconButton.itemID = entry.itemID
      row.name:SetText(self:GetItemLabel(entry.itemID))
      row.target:SetText(entry.target or 0)
      row.bags:SetText(bagCount)
      row.bank:SetText(bankCount)

      if missing > 0 then
        row.missing:SetTextColor(1, 0.25, 0.25)
      else
        row.missing:SetTextColor(0.25, 1, 0.4)
      end
      row.missing:SetText(missing)
    else
      row:Hide()
    end
  end
end

function CK:RefreshOverviewStatus()
  if self.bankOpen then
    self.mainFrame.overviewPanel.bankStatus:SetText("|cff80ff80Bank open|r")
    self.mainFrame.overviewPanel.withdrawButton:Enable()
  else
    if self.bankCache and tcount(self.bankCache) > 0 then
      self.mainFrame.overviewPanel.bankStatus:SetText("|cffffff80Bank closed - using cached bank counts|r")
    else
      self.mainFrame.overviewPanel.bankStatus:SetText("|cffff8080Bank closed|r")
    end
    self.mainFrame.overviewPanel.withdrawButton:Disable()
  end
end

function CK:RefreshAll()
  if not self.mainFrame then
    return
  end
  self:RefreshProfileControls()
  self:RefreshActiveRows()
  self:RefreshCatalogRows()
  self:RefreshOverviewRows()
  self:RefreshOverviewStatus()
end

function CK:BuildPlayerPlacementState()
  local state = {
    emptySlots = {},
    emptyIndex = 1,
  }
  local bag

  for bag = 0, 4 do
    local numSlots = GetContainerNumSlots(bag)
    if numSlots and numSlots > 0 then
      local slot
      for slot = 1, numSlots do
        local link = GetContainerItemLink(bag, slot)
        if not link then
          table.insert(state.emptySlots, { bag = bag, slot = slot })
        end
      end
    end
  end

  return state
end

function CK:BuildWithdrawOperations()
  local operations = {}
  local playerCounts = self.playerCounts or {}
  local bankCounts, bankSlots = self:ScanBankInventory()
  local active = self:GetActiveItemsSorted()
  local placementState = self:BuildPlayerPlacementState()
  local missingItems = 0
  local bankBackedItems = 0
  local freeSlots = table.getn(placementState.emptySlots)
  local i

  for i = 1, table.getn(active) do
    local entry = active[i]
    local itemID = entry.itemID
    local need = entry.target - (playerCounts[itemID] or 0)

    if need > 0 then
      missingItems = missingItems + 1
    end

    if need > 0 and (bankCounts[itemID] or 0) > 0 then
      bankBackedItems = bankBackedItems + 1
      local availableSources = {}
      local j

      for j = 1, table.getn(bankSlots[itemID] or {}) do
        local source = bankSlots[itemID][j]
        table.insert(availableSources, { bag = source.bag, slot = source.slot, remaining = source.count })
      end

      while need > 0 and table.getn(availableSources) > 0 do
        local empty = placementState.emptySlots[placementState.emptyIndex]
        if not empty then
          break
        end

        placementState.emptyIndex = placementState.emptyIndex + 1

        local source = availableSources[1]
        local moveCount = source.remaining
        if moveCount > need then
          moveCount = need
        end
        if moveCount > self:GetItemStackSize(itemID) then
          moveCount = self:GetItemStackSize(itemID)
        end
        if moveCount <= 0 then
          break
        end

        table.insert(operations, {
          itemID = itemID,
          count = moveCount,
          sourceBag = source.bag,
          sourceSlot = source.slot,
          destBag = empty.bag,
          destSlot = empty.slot,
        })

        source.remaining = source.remaining - moveCount
        need = need - moveCount

        if source.remaining <= 0 then
          table.remove(availableSources, 1)
        end
      end
    end
  end

  return operations, {
    missingItems = missingItems,
    bankBackedItems = bankBackedItems,
    freeSlots = freeSlots,
  }
end

function CK:RunNextWithdrawOperation()
  if not self.withdrawQueue or table.getn(self.withdrawQueue) == 0 then
    self.withdrawRunning = nil
    self.queueFrame:SetScript("OnUpdate", nil)
    self:ScanInventories()
    self:RefreshAll()
    self:Print("Withdrawal complete. Moved " .. (self.withdrawMoved or 0) .. " items.")
    return
  end

  if CursorHasItem() then
    ClearCursor()
  end

  local op = self.withdrawQueue[1]
  local _, sourceCount, sourceLocked = GetContainerItemInfo(op.sourceBag, op.sourceSlot)
  sourceCount = sourceCount or 0
  local sourceLogicalCount = self:GetLogicalItemCount(op.itemID, sourceCount)
  if sourceLogicalCount <= 0 then
    table.remove(self.withdrawQueue, 1)
    return
  end

  local destLink = GetContainerItemLink(op.destBag, op.destSlot)
  local _, destCount, destLocked = GetContainerItemInfo(op.destBag, op.destSlot)
  local destID = parseItemIDFromLink(destLink)
  local destLogicalCount = self:GetLogicalItemCount(op.itemID, destCount)
  local stackSize = self:GetItemStackSize(op.itemID)

  if sourceLocked or destLocked then
    return
  end

  if destLink and destID ~= op.itemID then
    table.remove(self.withdrawQueue, 1)
    self:Print("Skipped one move because the destination slot changed.")
    return
  end

  if destLink and destLogicalCount >= stackSize then
    table.remove(self.withdrawQueue, 1)
    return
  end

  if op.count > sourceLogicalCount then
    op.count = sourceLogicalCount
  end

  if stackSize > 1 and op.count < sourceLogicalCount then
    SplitContainerItem(op.sourceBag, op.sourceSlot, op.count)
  else
    PickupContainerItem(op.sourceBag, op.sourceSlot)
  end

  if not CursorHasItem() then
    return
  end

  PickupContainerItem(op.destBag, op.destSlot)
  table.remove(self.withdrawQueue, 1)
  self.withdrawMoved = (self.withdrawMoved or 0) + op.count
end

function CK:StartWithdraw()
  if not self.bankOpen then
    self:Print("Open your bank first.")
    return
  end

  if self.withdrawRunning then
    self:Print("A withdrawal is already in progress.")
    return
  end

  self:ScanInventories()

  local operations, info = self:BuildWithdrawOperations()
  if table.getn(operations) == 0 then
    if info.missingItems == 0 then
      self:Print("Nothing to withdraw. Your bags already meet the target.")
    elseif info.bankBackedItems == 0 then
      self:Print("Nothing to withdraw. Missing items are not available in your bank.")
    elseif info.freeSlots == 0 then
      self:Print("Nothing to withdraw safely. You need at least one free bag slot.")
    else
      self:Print("Nothing to withdraw safely. Not enough free bag slots for the missing items.")
    end
    return
  end

  self.withdrawQueue = operations
  self.withdrawRunning = 1
  self.withdrawMoved = 0
  self.queueElapsed = 0
  self:Print("Starting withdrawal: " .. table.getn(operations) .. " move(s) queued.")

  self.queueFrame:SetScript("OnUpdate", function()
    CK.queueElapsed = CK.queueElapsed + arg1
    if CK.queueElapsed < 0.12 then
      return
    end
    CK.queueElapsed = 0
    CK:RunNextWithdrawOperation()
  end)
end

function CK:OnEvent()
  if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
    self:EnsureDB()
    self:InstallLinkHook()
    self:CreateMainFrame()
    self:CreateMinimapButton()
    self:ScanInventories()
    self:RefreshAll()
    self:Print("Raid consumable planner loaded. Author: Eggorkus <BELUGA>, Nordanaar. Left-click the minimap icon to open.")
  elseif event == "BAG_UPDATE" or event == "PLAYERBANKSLOTS_CHANGED" then
    self:ScanInventories()
    self:RefreshAll()
  elseif event == "BANKFRAME_OPENED" then
    self.bankOpen = 1
    self:ScanInventories()
    self:RefreshAll()
  elseif event == "BANKFRAME_CLOSED" then
    self.bankOpen = nil
    self:ScanInventories()
    self:RefreshAll()
  elseif event == "PLAYER_ENTERING_WORLD" then
    self:ScanInventories()
    self:RefreshAll()
  end
end

function CK:CreateEventFrame()
  local frame = CreateFrame("Frame", "ChemKeeperEventFrame", UIParent)
  frame:RegisterEvent("ADDON_LOADED")
  frame:RegisterEvent("PLAYER_ENTERING_WORLD")
  frame:RegisterEvent("BAG_UPDATE")
  frame:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
  frame:RegisterEvent("BANKFRAME_OPENED")
  frame:RegisterEvent("BANKFRAME_CLOSED")
  frame:SetScript("OnEvent", function()
    CK:OnEvent()
  end)
  self.eventFrame = frame
end

function CK:CreateQueueFrame()
  self.queueFrame = CreateFrame("Frame", "ChemKeeperQueueFrame", UIParent)
end

StaticPopupDialogs["CHEMKEEPER_DELETE_PROFILE"] = {
  text = "Delete profile \"%s\"?",
  button1 = "Delete",
  button2 = "Cancel",
  OnAccept = function()
    CK:DeleteCurrentProfile()
  end,
  timeout = 0,
  whileDead = 1,
  hideOnEscape = 1,
}

SLASH_CHEMKEEPER1 = "/chemkeeper"
SLASH_CHEMKEEPER2 = "/ck"
SlashCmdList["CHEMKEEPER"] = function(msg)
  msg = string.lower(msg or "")

  if msg == "overview" then
    if not CK.mainFrame:IsShown() then
      CK.mainFrame:Show()
    end
    CK:SetView("overview")
    CK:ScanInventories()
    CK:RefreshAll()
  elseif msg == "edit" then
    if not CK.mainFrame:IsShown() then
      CK.mainFrame:Show()
    end
    CK:SetView("edit")
    CK:ScanInventories()
    CK:RefreshAll()
  else
    CK:ToggleMainFrame()
  end
end

CK:CreateQueueFrame()
CK:CreateEventFrame()
