--[[ *******************************************************************************

  Omicron Media Player

  Author: Fábio Pichler
  Website: http://fabiopichler.net
  License: BSD 3-Clause License

  Copyright (c) 2015-2019, Fábio Pichler
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.

  * Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

  * Neither the name of Omicron Media Player nor the names of its
    contributors may be used to endorse or promote products derived from
    this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

******************************************************************************* --]]

-------------------------------------------------------------------------------
-- new() --
-------------------------------------------------------------------------------

local windowIconLabel = Label.new()
local windowTitleLabel = Label.new()

local minimizeButton = PushButton.new()
local minimizeTrayButton = PushButton.new()
local closeButton = PushButton.new()

-------------------------------------------------------------------------------
-- setObjectName() --
-------------------------------------------------------------------------------

titleBarWidget:setObjectName("titleBar")

windowIconLabel:setObjectName("windowIcon")
windowTitleLabel:setObjectName("windowTitle")

minimizeButton:setObjectName("minimizeButton")
minimizeTrayButton:setObjectName("minimizeTrayButton")
closeButton:setObjectName("closeButton")

-------------------------------------------------------------------------------
-- setToolTip() --
-------------------------------------------------------------------------------

windowIconLabel:setToolTip("<3")
--windowTitleLabel:setToolTip("")

minimizeButton:setToolTip("Minimizar")
minimizeTrayButton:setToolTip("Minimizar para a Bandeja")
closeButton:setToolTip("Fechar")

-------------------------------------------------------------------------------
-- setText() --
-------------------------------------------------------------------------------

windowTitleLabel:setText(mainWindow:windowTitle())

-------------------------------------------------------------------------------
-- connect() --
-------------------------------------------------------------------------------

Object.connect(mainWindow, "windowTitleChanged(QString)", windowTitleLabel, "setText(QString)")
Object.connect(minimizeButton, "clicked()", mainWindow, "showMinimized()")
Object.connect(minimizeTrayButton, "clicked()", mainWindow, "hide()")
Object.connect(closeButton, "clicked()", titleBarWidget, "closeApp()")

-------------------------------------------------------------------------------
-- BoxLayout --
-------------------------------------------------------------------------------

local titleBarLayout = BoxLayout.new(BoxLayout.Horizontal)
titleBarLayout:setSpacing(0)
titleBarLayout:setMargin(0)
titleBarLayout:addWidget(windowIconLabel)
titleBarLayout:addWidget(windowTitleLabel, 1)
titleBarLayout:addWidget(minimizeButton)
titleBarLayout:addWidget(minimizeTrayButton)
titleBarLayout:addWidget(closeButton)

titleBarWidget:setLayout(titleBarLayout)
