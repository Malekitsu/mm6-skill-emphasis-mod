# Might & Magic 6: skill emphasis mod

# Goals

RPG character advancement should be mainly based on their skill progression with some small non skill based effects here and there from equipment, barrels, quests, etc. Putting it simply high skill should be a primary source of every property character has. That what R in RPG is. You build a role by pumping skill points into certain area. Like if you are focusing on axe skill only then you expect this character to be an outstanding axeman but appaling swordman. This is **NOT** like that in M&M engine. Mastering the skill is undoubtedly more difficult endeavour than aquiring an expensive item. Yet those expensive items give about same bonus in attack and damage as mastering the skill. I would love to turn this around and give skills their well deserved attention. Usually one could raise their selected skills somewhere to level 10 on average by the end of the game. Since there are so few of them we should make player to cherish each skill point and use every possibility to invest more in primary weapon skills.

# Recovery time cap problem

Recovery time cap is relatively easy reacheable. As soon as it hits the cap further investment in recovery time reduction is a waste. I propose to turn recovery time reduction bonus into attack speed increase bonus. Then it naturally will be treated same exactly way as any other game stat. Meaning adding 100 atack speed bonus on top of base 100 recovery time makes player attack twice as fast and so on. With this approach reaching recovery time is still possible but it reqires enormouos investments into skill. So we safely can stop worrying about it. See computation example below.

With this approach any constant speed bonus like Haste or weapon skill benefits slightly more to slower weapon.

## Weapon base recovery time correction

Instead of base recovery time each weapon gets speed bonus which is roughly correspond to its vanilla base recovery.

|weapon|speed bonus|resuting recovery|
|----|----:|----:|
|Staff,Axe|0|100|
|Sword|20|83|
|Spear,Mace|40|71|
|Dagger|80|55|

#### Computation example

##### Vanilla

<pre>
Dagger		=  60 base recovery time (40 recovery time reduction bonus)
500 speed	= -30 recovery time bonus
haste		= -25 recovery time bonus

result		=   5 recovery time but it is capped at 30
</pre>

##### This mod

<pre>
Total recovery time reduction bonus from above example = 100 - 5 = 95
This mod treats it as attack speed increase bonus = 95
Resulting attack speed = 100 + 95 = 195
Resulting recovery time = 100 \* (100 / 195) = 51 recovery time, no capping needed
</pre>

With all additional bonuses added melee cap is reached at the skill level 22 which is pretty high and rarely reacheable. Range cap is reached at the skill level 190 which is never. Regardless of caps recovery time in this model it is never negative.

# Skill effects progression analysis

## Attack bonus

Bare bonus not including weapon skill

|source|value (early game)|value (late game)|
|----|----:|----:|
|accuracy effect|0|10|
|weapon bonus|0|10|
|second weapon bonus|0|10|
|buffs (Bless, Hour of Power)|5|45|
|total|5|75|

Average monster AC throughout the game: 0 - 100.

Let assume monster AC grows about as fast as our bare attack bonus throughout the game for calculation simplicity. Here is how much +1 attack bonus increases chance to hit based on bare bonus player already has at the time.

|game stage|bare bonus|chance to hit improvement for +1 attack bonus|
|----|----:|----:|
|early game|0|1.7%|
||10|1.0%|
||20|0.7%|
||30|0.6%|
||40|0.5%|
|late game|50|0.4%|

Early game imporvement is relatively noticeable but it decreases strongly as game progresses.

## Recovery time

Bare bonus not including weapon skill

|source|value (early game)|value (late game)|
|----|----:|----:|
|speed effect|0|10|
|swift weapon|0|20|
|buffs (Haste)|25|25|
|total|25|55|

Here is how much +1 recovery time bonus increases attack frequency based on bare bonus player already has at the time.

|game stage|bare bonus|attack frequency improvement for +1 recovery time bonus|
|----|----:|----:|
|early game|0|1.0%|
||10|0.9%|
||20|0.8%|
||30|0.8%|
||40|0.7%|
|late game|50|0.7%|

Early game imporvement is less than corresponding attack bonus one. However it declines not as drastically as game progresses.

## Damage bonus

Bare bonus not including weapon skill

|source|value (early game)|value (late game)|
|----|----:|----:|
|might effect|0|10|
|weapon damage|10|10|
|second weapon damage|0|10|
|weapon bonus|0|10|
|weapon enchantments|0|10|
|second weapon enchantments|0|10|
|buffs (Heroism, Hour of Power)|5|45|
|total|15|105|

Here is how much +1 recovery time bonus increases attack frequency based on bare bonus player already has at the time.

|game stage|bare bonus|attack damage improvement for +1 damage bonus|
|----|----:|----:|
|early game|10|10.0%|
||20|5.0%|
||30|3.3%|
||40|2.5%|
||50|2.0%|
||60|1.7%|
||70|1.4%|
|late game|80|1.3%|

Early game imporvement is huge due to low combined damage at the time. End game improvement is still about twice as better as for recovery time bonus.

## AC bonus

Bare bonus not including weapon skill

|source|value (early game)|value (late game)|
|----|----:|----:|
|speed effect|0|10|
|equipment AC|0|80|
|AC enchantments|0|10|
|buffs (Stone Skin)|5|45|
|total|5|145|

Average monster attack bonus throughout the game: 0 - 200.

Let assume monster attack bonus about as fast as our bare AC throughout the game for calculation simplicity. Here is how much +1 AC decreases monster's chance to hit us based on bare bonus player already has at the time.

|game stage|bare bonus|monster's chance to hit decrease for +1 AC|
|----|----:|----:|
|early game|0|5.0%|
||20|1.0%|
||40|0.6%|
||60|0.4%|
||80|0.3%|
|late game|100|0.2%|

Similar to attack bonus the effectiveness of AC bonus falls drastically toward the end of the game.

# Proposed skill modification

## Weapon

### Weapon bonuses increase per skill level depending on rank

|bonus|normal|expert|master|master level 10|improvement compared to vanilla|
|----|----:|----:|----:|----:|----|
|Attack|6|8|10|+100|x1.5 increase in player hit frequency against toughest monsters (40% -> 60%).|
|Speed|4|6|8|+80|x1.5 increase in attack speed (150 -> 230).|
|Damage|3|4|5|+50|x1.5 increase in damage (100 -> 150).|
|Dagger chance to cause triple damage|3|4|5|+50|x2 dagger damage multiplier (1 -> 2).|
|Armor Class|9|12|15|+150|x1.5 decrease in toughest monster hit frequency against player (60% -> 40%).|
|Resistances|3|4|5|+50|x1.5 decrease in magic attack damage against player (75% -> 45%).|

### Resulting weapon damage rate increase at master level 10 due to improved skills

|weapon|attack|speed|damage|damage rate improvement compared to vanilla|
|----|----:|----:|----:|----:|
|Staff|+100|0|0|1.5|
|Sword|+100|+100|0|2.2|
|Dagger|+100|0|x2|3.0|
|Axe|+100|+100|+50|3.4|
|Spear|+100|0|+50|2.2|
|Mace|+100|0|+50|2.2|

Axe is being an ultimate weapon of destruction as game intende it to be. Axe - Sword is now also a most destructive dual wield combo (see dual wield section for details).

Other weapons are somewhat weaker but possess some other qualities instead. Staff is an ultimate anti magic and complete protection tool. Sword is powerful dual wield companion. Spear is for physical damage protection. Mace is a counter attack tool. Dagger is faster and stronger at the beginning but doesn't progress that well with skill.

### Mace special abilities

Mace has a chance to paralize opponent. This ability is immediatelly available at normal skill rank.

I've replaced stun to paralize because stun does not add to monster recovery in MM6 (= useless). Paralize is a stronger version of stun that has duration and is visual.

* Chance to cause an effect = 6% on normal, 8% on expert, 10% on master.
* Duration of an effect = 1 minute per skill level.

**Skill master level 20 roughly keeps one enemy under effect all the time.**

### Staff special abilities

Staff adds to AC and all resistances. See multiplers in weapon bonuses table above.

Staff has a chance to slow and feeblemind. These abilities are immediatelly available at normal skill rank.

* Chance to cause an effect = 12% on normal, 16% on expert, 20% on master.
* Duration of an effect = 1 minute per skill level.

**Skill master level 10 roughly keeps one enemy under effect all the time.**

## Armor

### AC bonus per level

|bonus|stat increase per level|
|----|----:|
|Armor Class|10|

### Recovery penalties

|armor type|normal|expert|master|
|----|----:|----:|----:|
|leather|20|10|0|
|chain|40|20|0|
|plate|60|30|0|

## Shield 

### AC bonus per level

|bonus|normal|expert|master|
|----|----:|----:|----:|
|Armor Class|6|8|10|

# Dual wield

Dual wield rules are quite complicated in MM6. Player need to remember which weapon uses attack, speed, damage bonuses and which does not. Ugh. Moreover, some of the skill bonuses and enchantment effects may not work if you apply them to the weapon in wrong hand. Most of the time you are out of luck as you cannot possibly wield some weapons in off hand. This is certainly a waste of skills and enchantments. Why not make them all count? That makes it much easier to distribute skill points and fairer to both weapon skills.

## Dual wield modification proposal

* Weapon skill attack bonuses are combined. This makes them hit roughly 50% more often with both skills on master level 10.
* Weapon skill damage bonuses are combined. This does not change anything since off hand weapons (dagger, sword) do not increase damage with skill.
* Weapon skill speed bonuses are averaged. This slows down speed progression for spear/mace-sword combo making it eventually less devastating comparing to axe-sword.

# Two handed weapon

Dual wield is superior to two handed weapon in MM6 as it combines both weapons base attack and damage. Heavy two handed weapon should naturally increase damage.

## Two handed weapon modification proposal

* Two handed weapon increases damage by 40%.

# Class speciality

MM6 classes are kind of undistingushable in weapon skills. That's why Paladin is superior to Knight in any way as they can develop all the same weapon/armor skill but also have magic on top of that. I believe some class weapon specialization is in order to make them really represent their strengths.

## Additional weapon skill damage/level for classes

|initial class|weapon type affected|initial|1st promotion|2nd promotion|
|----|----|----:|----:|----:|
|Knight|all melee weapons|4|5|6|
|Paladin|all melee weapons|1|2|3|
|Archer|all ranged weapons|1|2|3|

This is similar to armsmaster bonus in MM7 but more distinctive. Knight become an ultimate weapon armsmaster with Paladin following. Archer specializes in ranged damage instead and now becomes quite powerful shooter.

## Weapon usage preference analysis

### Dual weild recovery

Now when dual wield recovery is an average of **actual** both weapon recoveries it is beneficial to combine any weapon with any to get a recovery bonus from weapon in each hand.

#### Examples

Spear + Dagger benefits from dagger speed and result in 70 recovery instead of 80 in vanilla.

Spear + Sword has initial recovery of 85 instead of 90 in vanilla. However, it progresses about half as slow as in vanilla due to Sword contributing only half of its bonus with skill advancement.

Axe + Sword has initial recovery of 95 instead of 100 in vanilla. However, it progresses faster than any other combo due to both weapon skills contributing to recovery. It becomes fastest combo when both weapon skills contribute -25 recovery to common pool.

### Dual wield vs. two handed weapon

Dual wield is very beneficial at low skill level as it combines base damage and attack of both weapons. Then it keeps combining attack from both weapons. However, attack is the least beneficial parameter. Its progression slows down tremendously at higher skill levels. On top of that it is capped at 100% hig chance. Will all huge attack bonuses in this mod it is impossible to improve hit chance more than twice comparing to vanilla. Damage, in turn, keeps growing lineraly and is not limited. Will all other conditions being equal two handed weapon will prevail toward the end of the game. This is true to non melee combat oriented classes (Archer, Cleric, Druid, Sourcerer).

It is different for melee combat oriented classes like Knight (and Paladin to lesser extent). With their inherent skill damage bonus it adds to **ALL** weapons including those normally not increasing damage with skill like Sword and Dagger. With dual wielding Knight keeps adding to damage of both weapons which eventually overruns two handed damage bonus.

Knight should master Sword and switch to dual wielding as soon as possible. Paladin may start working toward Sword mastery after it reaches mastery in some other weapon like Axe or Spear. Other non melee combat oriented classes may use Dagger in left hand for its added speed and damage if they don't plan to invest in weapons much. Otherwise, they may invest in two handed Axe or Spear. Spear actually is even stronger at the beginning due to additional two handed damage roll. Axe becomes faster than Spear when it accumulates 20 recovery (about expert level 5).

# Spells

All spells always hit. Making just a few spells to hit depending on skill level is too fine grained and hard to visualize mechanics that is absolutely not needed.

Most spells generally progress well with skill level. This is an adjustment for those that do not. I've reshuffled their fixed and per level values so that they have more standard strength formula: X + 1-X / level. At the same time I tried to make old and new versions about equally strong at level 4.

|spell|fixed|per level|
|----|----:|----:|
|Ring Of Fire|3|1-3|
|Meteor Shower|4|1-4|
|Inferno|5|1-5|
|Starburst|8|1-8|
|Ice Blast|10|1-10|
|Stone Skin|0|5|
|Death Blossom|8|1-8|
|Bless|0|5|
|Healing Touch|3-7, 6-14, 9-21||
|Heroism|10|1,1,2|
|Mind Blast|4|1-4|
|First Aid|5, 15, 25||
|Harm|5|1-5|
|Cure Wounds|5|4|
|Flying Fist|14|1-14|
|Power Cure|10|4|
|Prismatic Light|10|1-10|

## Bless, Heroism, Hour Of Power problem

Bless and Heroism grant relatively small bonus of +15 even at master level 10. Whereas, Hour Of Power is insanely overpowered granting +45 of both attack and damage at master level 10. This is an enourmous advantage that renders basic self magic spells utterly useless. The only fix to that I found is to increase skill multiplier for basic self spells based on mastery.

